//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Lyndi Castrejon on 4/20/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            // MARK: Recipe Image
            Image(recipe.image)
                .resizable()
                .scaledToFill()
            
            // MARK: Ingredients
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.headline)
                    .padding([.top, .bottom], 5)
                
                ForEach(recipe.ingredients, id: \.self) { item in
                    Text("• " + item)
                        .padding(.bottom, 1)
                }
            }
            Divider()
            // MARK: Directions
            VStack(alignment: .leading) {
                Text("Directions")
                    .font(.headline)
                    .padding([.leading, .vertical], 10)
                
                ForEach(0..<recipe.directions.count, id: \.self) { index in
                    Text(String(index + 1) + ". " + recipe.directions[index])
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                }
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
