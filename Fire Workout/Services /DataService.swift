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
    private let menuItems = [ menuItem(title: "Exercises", img: "exercises" , storyboardID : "SWReveal" ), menuItem(title: "Plans", img: "plans" , storyboardID: "plansVC"  ) , menuItem(title: "Custom", img: "custom" , storyboardID : "customVC"   ) , menuItem(title: "Logout", img: "logout" , storyboardID : ""  )  ]
    private let muscles:[Muscle] = [.back , .abs , .chest , .biceps , .triceps , .legs   ]
    func getMenuItems() -> [menuItem] {
        return menuItems
    }
    func getMuscles() -> [Muscle] {
        return muscles
    }
    
    
}
