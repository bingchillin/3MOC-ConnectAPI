//
//  User.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class Album: CustomStringConvertible {
    
    let firstname: String
    let name: String
    let address : String
    let city : String
    let cp : String
    let password : String
    let weight : Double
    let height : Double
    let email : String
    let calorie : Int
    var description: String {
        return "<user firstname='\(firstname)' name='\(name)' address='\(address)' city='\(city)'cp='\(cp)' password='\(password)' weight='\(weight)' height='\(height)' email='\(email)' calorie='\(calorie)'/>"
    }
    
    init(firstname: String, name: String, address: String, city: String, cp: String, password: String, weight: Double,
         height: Double, email: String) {
        self.firstname = firstname
        self.name = name
        self.address = address
        self.city = city
        self.cp = cp
        self.password = password
        self.weight = weight
        self.height = height
        self.email = email
    }
}
