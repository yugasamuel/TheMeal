//
//  MealDetailView.swift
//  TheMeal
//
//  Created by Yuga Samuel on 14/08/23.
//

import SwiftUI

struct MealDetailView: View {
    let id: String
    @EnvironmentObject var viewModel: MealViewModel
    
    var mealIndex: Int {
        viewModel.meals.firstIndex(where: { $0.id == id})!
    }
    
    var body: some View {
        List {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: viewModel.mealDetails[mealIndex].thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
                .cornerRadius(6)
                .shadow(radius: 3)
                Spacer()
            }
            
            Section {
                Text("Area: \(viewModel.mealDetails[mealIndex].area)")
                Text("Category: \(viewModel.mealDetails[mealIndex].category)")
            }
            
            Section("Instructions") {
                Text(viewModel.mealDetails[mealIndex].instructions)
            }
            
            Section("Ingredients") {
                Text(viewModel.mealDetails[mealIndex].ingredient1)
                Text(viewModel.mealDetails[mealIndex].ingredient2)
                Text(viewModel.mealDetails[mealIndex].ingredient3)
                Text(viewModel.mealDetails[mealIndex].ingredient4)
                Text(viewModel.mealDetails[mealIndex].ingredient5)
                Text(viewModel.mealDetails[mealIndex].ingredient6)
                Text(viewModel.mealDetails[mealIndex].ingredient7)
                Text(viewModel.mealDetails[mealIndex].ingredient8)
                Text(viewModel.mealDetails[mealIndex].ingredient9)
            }
        }
        .navigationTitle(viewModel.mealDetails[mealIndex].name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(id: "52772")
            .environmentObject(MealViewModel())
    }
}
