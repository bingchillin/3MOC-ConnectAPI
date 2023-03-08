//
//  TrainingPlanFactory.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class TrainingPlanFactory {
    
    class func trainingPlan(from dict: [String: Any]) -> TrainingPlan? {
        guard let id = dict["id"] as? Int,
              let uId = dict["id_user"] as? Int,
              let n = dict["name"] as? String,
              let c = dict["category"] as? String else {
            return nil
        }
        return TrainingPlan(id: id, id_user: uId, name: n, category: c)
    }
    
    class func trainingPlans(from arr: [ [String: Any ] ]) -> [TrainingPlan] {
        return arr.compactMap { dict in
            return trainingPlan(from: dict)
        }
    }
}
