//
//  DetailPlanFactory.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class DetailPlanFactory {
    
    class func detailPlan(from dict: [String: Any]) -> DetailPlan? {
        guard let eId = dict["id_exercise"] as? Int,
              let tId = dict["id_plan"] as? Int,
              let t = dict["timer"] as? Int,
              let r = dict["repetition"] as? Int,
              let s = dict["set"] as? Int else {
            return nil
        }
        return DetailPlan(id_exercise: eId, id_plan: tId, timer: t, repetition: r, set: s)
    }
    
    class func detailPlans(from arr: [ [String: Any ] ]) -> [DetailPlan] {
        return arr.compactMap { dict in
            return detailPlan(from: dict)
        }
    }
}
