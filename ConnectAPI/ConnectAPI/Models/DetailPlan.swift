//
//  DetailPlan.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class DetailPlan: CustomStringConvertible {
    
    let id_exercise: Int
    let id_plan: Int
    let timer: Int
    let repetition: Int
    let set: Int
    var description: String {
        return "<DetailPlan id_exercise='\(id_exercise)' id_plan='\(id_plan)' timer='\(timer)' repetition='\(repetition)' set='\(set)'/>"
    }
    
    init(id_exercise: Int, id_plan: Int, timer: Int, repetition: Int, set: Int) {
        self.id_exercise = id_exercise
        self.id_plan = id_plan
        self.timer = timer
        self.repetition = repetition
        self.set = set
    }
}
