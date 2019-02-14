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
    private let menuItems = [ menuItem(title: "Exercises", img: "exercises"), menuItem(title: "Plans", img: "plans") , menuItem(title: "Custom", img: "custom") , menuItem(title: "Logout", img: "logout")  ]
    private let muscles:[Muscle] = [.back , .abs , .chest , .biceps , .triceps , .legs   ]
    func getMenuItems() -> [menuItem] {
        return menuItems
    }
    func getMuscles() -> [Muscle] {
        return muscles
    }
    
    
}
