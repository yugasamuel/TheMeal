//
//  Meal.swift
//  TheMeal
//
//  Created by Yuga Samuel on 14/08/23.
//

import Foundation

struct Response: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name  = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func loadData() async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.meals = decodedResponse.meals
                }
            }
        } catch {
            meals = []
        }
    }
}
