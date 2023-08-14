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

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name  = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
