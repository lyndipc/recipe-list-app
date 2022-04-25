//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Lyndi Castrejon on 4/24/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .font(.title)
            
            GeometryReader { g in
                TabView {
                    ForEach(0..<model.recipes.count) { index in
                        
                        // Only show recipes that should be featured
                        if model.recipes[index].featured {
                            // Recipe card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                                .padding(.bottom)
                            }
                            .frame(width: g.size.width - 40, height: g.size.height - 100)
                            .cornerRadius(10)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Preparation Time: ")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
