//
//  IngredientFactory.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class IngredientFactory {
    
    class func ingredient(from dict: [String: Any]) -> Ingredient? {
        guard let id = dict["id"] as? Int,
              let n = dict["name"] as? String,
              let c = dict["calorie"] as? Int else {
            return nil
        }
        return Ingredient(id: id, name: n, calorie: c)
    }
    
    class func ingredients(from arr: [ [String: Any ] ]) -> [Ingredient] {
        return arr.compactMap { dict in
            return ingredient(from: dict)
        }
    }
}
