//
//  TrainingPlan.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class TrainingPlan: CustomStringConvertible {
    
    let id: Int
    let id_user: Int
    let name: String
    let category: String
    var description: String {
        return "<trainingplan id='\(id)' id_user='\(id_user)' name='\(name)' categories='\(category)'/>"
    }
    
    init(id: Int, id_user: Int, name: String, category: String) {
        self.id = id
        self.id_user = id_user
        self.name = name
        self.category = category
    }
}

