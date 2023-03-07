//
//  RecipeFactory.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class RecipeFactory {
    
    class func recipe(from dict: [String: Any]) -> Recipe? {
        guard let id = dict["id"] as? Int,
              let uId = dict["id_user"] as? Int,
              let n = dict["name"] as? String,
              let t = dict["timer"] as? Int,
              let d = dict["description"] as? String else {
            return nil
        }
        return Recipe(id: id, id_user: uId, name: n, timer: t, description: d)
    }
    
    class func recipes(from arr: [ [String: Any ] ]) -> [Recipe] {
        return arr.compactMap { dict in
            return recipe(from: dict)
        }
    }
}
