//
//  DataService.swift
//  Recipe List App
//
//  Created by Lyndi Castrejon on 4/20/22.
//

import Foundation

class DataService {
    
    // static or type method --> a data type method --> allows you to call method directly on data type
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                }
                
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
    }
}
