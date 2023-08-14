//
//  TheMealApp.swift
//  TheMeal
//
//  Created by Yuga Samuel on 14/08/23.
//

import SwiftUI

@main
struct TheMealApp: App {
    @StateObject var viewModel = MealViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
