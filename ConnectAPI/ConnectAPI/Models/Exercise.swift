//
//  Exercise.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class Exercise: CustomStringConvertible {
    
    let id: Int
    let name: String
    let description: String
    var descriptionReturn: String {
        return "<Exercise id='\(id)' name='\(name)' description='\(description)'/>"
    }
    
    init(id: Int, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
        
    }
}
