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

struct Meal: Codable, Hashable {
    let id: String
    let name: String
    let thumbnail: String
    let category: String
    let area: String
    let instructions: String
    let ingredient1: String
    let ingredient2: String
    let ingredient3: String
    let ingredient4: String
    let ingredient5: String
    let ingredient6: String
    let ingredient7: String
    let ingredient8: String
    let ingredient9: String

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name  = "strMeal"
        case thumbnail = "strMealThumb"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
    }
}
