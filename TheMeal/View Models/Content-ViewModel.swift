//
//  Content-ViewModel.swift
//  TheMeal
//
//  Created by Yuga Samuel on 14/08/23.
//

import Foundation

final class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var mealDetails: [MealDetail] = []
    
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
    
    func loadDetailData() async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(DetailResponse.self, from: data) {
                DispatchQueue.main.async {
                    let meals = decodedResponse.meals
                    self.meals.insert(Meal(id: meals[0].id, name: meals[0].name, thumbnail: meals[0].thumbnail) ,at: 0)
                    self.mealDetails = meals
                }
            }
        } catch {
            mealDetails = []
        }
    }
}

