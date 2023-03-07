//
//  Ingredient_detail.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class Ingredient_detail: CustomStringConvertible {
    
    let id: Int
    let id_recipe: Int
    let id_ingredient: Int
    let quantity: Double
    let weight: Double
    let calorie: Int
    var description: String {
        return "<ingredient_Detail id='\(id)' id_recipe='\(id_recipe)' id_ingredient='\(id_ingredient)' quantity='\(quantity)' weight='\(weight)' calorie='\(calorie)'/>"
    }
    
    init(id: Int, id_recipe: Int, id_ingredient: Int, quantity: Double, weight: Double, calorie: Int) {
        self.id = id
        self.id_recipe = id_recipe
        self.id_ingredient = id_ingredient
        self.quantity = quantity
        self.weight = weight
        self.calorie = calorie
    }
}
