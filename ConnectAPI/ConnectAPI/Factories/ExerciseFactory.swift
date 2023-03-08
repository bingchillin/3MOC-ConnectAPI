//
//  ExerciseFactory.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class ExerciseFactory {
    
    class func exercise(from dict: [String: Any]) -> Exercise? {
        guard let id = dict["id"] as? Int,
              let n = dict["name"] as? String,
              let d = dict["description"] as? String else {
            return nil
        }
        return Exercise(id: id, name: n, description: d)
    }
    
    class func exercises(from arr: [ [String: Any ] ]) -> [Exercise] {
        return arr.compactMap { dict in
            return exercise(from: dict)
        }
    }
}
