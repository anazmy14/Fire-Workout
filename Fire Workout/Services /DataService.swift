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
    private let menuItems = [ MenuItem(title: "Exercises", img: "exercises" , storyboardID : "SWReveal" ), MenuItem(title: "Plans", img: "plans" , storyboardID: "plansVC"  ) , MenuItem(title: "Custom", img: "custom" , storyboardID : "customVC"   ) , MenuItem(title: "Logout", img: "logout" , storyboardID : ""  )  ]
    private let muscles:[Muscle] = [.back , .abs , .chest , .biceps , .triceps , .legs   ]
    private let beginnerPlans:[Plan] = [ Plan( name: "Beginner full body workout routine" , numOfDays : 3  ),
                                         Plan(name: "Home Routine for Male", numOfDays: 3),
                                         Plan(name: "Home Routine for Female", numOfDays: 3),
                                         Plan(name: "30 Minute No Equipment", numOfDays: 1)]
    private let intermediatePlans:[Plan] = [Plan(name: "3 days Full Body" , numOfDays: 3) ]
    private let advancedPlans:[Plan] = [Plan(name: "Simple Mass-Gain Split", numOfDays: 4) ]
    
    func getMenuItems() -> [MenuItem] {
        return menuItems
    }
    func getMuscles() -> [Muscle] {
        return muscles
    }
    
    func getPlans  (level:PlanLevel ) -> [Plan] {
        
        switch level {
        case .intermediate :
            return intermediatePlans
        case  .advanced :
            return advancedPlans
        default :
            return beginnerPlans
            
        }
        
        
    }
    
    
    
}
