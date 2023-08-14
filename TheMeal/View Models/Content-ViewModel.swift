//
//  Content-ViewModel.swift
//  TheMeal
//
//  Created by Yuga Samuel on 14/08/23.
//

import Foundation

extension ContentView {
    @MainActor class MealViewModel: ObservableObject {
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
}
