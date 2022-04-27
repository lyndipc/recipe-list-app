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
    
    // Static because it calls the method WITHOUT creating an instance of recipe model
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single portion size
            denominator *= recipeServings
            
            // Get target portion
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if num > denom & express remainder as a fraction
            if numerator >= denominator {
                
                // Calculate whole portions
                wholePortions = numerator / denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign to portion string
                portion += String(wholePortions)
                
                // Express remainder as a fraction
                if numerator > 0 {
                    portion += wholePortions > 0 ? " " : ""
                    portion += "\(numerator)/\(denominator)"
                }
            }
            else {
                portion += String(numerator)
            }
            
            if var unit = ingredient.unit {
                
                // Calculate appropriate suffix
                if wholePortions > 1 {
                    
                    if unit.suffix(2) == "ch" {
                        unit += "es"
                    }
                    else if unit.suffix(2) == "f" {
                        unit = String(unit.dropLast())
                        unit += "ves"
                    }
                    else {
                        unit += "s"
                    }
                }
                portion += (ingredient.num == nil && ingredient.denom == nil) ? "" : " "
                
                return portion + unit
            }
        }
        
        return portion
    }
}
