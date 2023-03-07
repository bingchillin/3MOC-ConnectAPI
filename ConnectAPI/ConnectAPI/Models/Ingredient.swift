//
//  Ingredient.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class Ingredient: CustomStringConvertible {
    
    let id: Int
    let name: String
    let calorie: Int
    var description: String {
        return "<ingredient id='\(id)' name='\(name)' calorie='\(calorie)'/>"
    }
    
    init(id: Int, name: String, calorie: Int) {
        self.id = id
        self.name = name
        self.calorie = calorie
    }
}

