//
//  ContentView.swift
//  TheMeal
//
//  Created by Yuga Samuel on 14/08/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: MealViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.meals, id: \.id) { meal in
                    Text(meal.name)
                }
            }
            .navigationTitle("TheMeal")
            .task {
                await viewModel.loadData()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MealViewModel())
    }
}
