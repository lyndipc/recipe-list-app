//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Lyndi Castrejon on 4/24/22.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
