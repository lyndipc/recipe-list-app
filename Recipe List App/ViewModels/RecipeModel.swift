//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Lyndi Castrejon on 4/20/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()  
    
    init() {
        self.recipes = DataService.getLocalData()
    }
}
