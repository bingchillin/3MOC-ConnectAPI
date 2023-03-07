//
//  Recipe.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class Recipe: CustomStringConvertible {
    
    let id: Int
    let id_user: Int
    let name: String
    let timer: Int
    let description: String
    var descriptionReturn: String {
        return "<recipe id='\(id)' id_user='\(id_user)' name='\(name)' timer='\(timer)' description='\(description)'/>"
    }
    
    init(id: Int, id_user: Int, name: String, timer: Int, description: String) {
        self.id = id
        self.id_user = id_user
        self.name = name
        self.timer = timer
        self.description = description
    }
}

