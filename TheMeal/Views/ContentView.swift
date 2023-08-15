//
//  ContentView.swift
//  TheMeal
//
//  Created by Yuga Samuel on 14/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MealViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.meals, id: \.id) { meal in
                    NavigationLink(value: meal) {
                        HStack {
                            AsyncImage(url: URL(string: meal.thumbnail)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            .cornerRadius(6)
                            .shadow(radius: 3)
                            
                            Text(meal.name)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("TheMeal")
            .navigationDestination(for: Meal.self) { meal in
                MealDetailView(id: meal.id)
            }
            .task {
                if viewModel.meals.isEmpty {
                    await viewModel.loadData()
                    await viewModel.loadDetailData()
                }
            }
        }
        .environmentObject(viewModel)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
