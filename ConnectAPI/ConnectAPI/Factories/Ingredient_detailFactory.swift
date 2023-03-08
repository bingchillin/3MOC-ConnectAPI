//
//  Ingredient_detailFactory.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class Ingredient_detailFactory {
    
    class func ingredient_detail(from dict: [String: Any]) -> Ingredient_detail? {
        guard let id = dict["id"] as? Int,
              let rId = dict["id_recipe"] as? Int,
              let iId = dict["id_ingredient"] as? Int,
              let q = dict["quantity"] as? Double,
              let w = dict["weight"] as? Double,
              let c = dict["calorie"] as? Int else {
            return nil
        }
        return Ingredient_detail(id: id, id_recipe: rId, id_ingredient: iId, quantity: q, weight: w, calorie: c)
    }
    
    class func ingredients_detail(from arr: [ [String: Any ] ]) -> [Ingredient_detail] {
        return arr.compactMap { dict in
            return ingredient_detail(from: dict)
        }
    }
}
