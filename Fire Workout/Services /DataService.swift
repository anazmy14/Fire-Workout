//
//  DataService.swift
//  Fire Workout
//
//  Created by an on 2/13/19.
//  Copyright © 2019 an. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    private let exercises = [ exercise(title: "Exercises", img: "exercises"), exercise(title: "Plans", img: "plans") , exercise(title: "Custom", img: "custom")   ]
    private let muscles:[Muscle] = [.back , .abs , .chest , .biceps , .triceps , .legs   ]
    func getExercises() -> [exercise] {
        return exercises
    }
    func getMuscles() -> [Muscle] {
        return muscles
    }
    
    
}
