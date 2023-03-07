//
//  Favorite.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class Favorite: CustomStringConvertible {
    
    let id_user: Int
    let id_recipe: Int
    var description: String {
        return "<favorite id_user='\(id_user)' id_recipe='\(id_recipe)'/>"
    }
    
    init(id_user: Int, id_recipe: Int) {
        self.id_user = id_user
        self.id_recipe = id_recipe
    }
}
