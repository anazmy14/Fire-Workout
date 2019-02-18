//
//  Plan.swift
//  Fire Workout
//
//  Created by an on 2/15/19.
//  Copyright © 2019 an. All rights reserved.
//

import Foundation

struct Plan {
    
    var name:String
    var days:[Day]
    var numOfDays:Int

    
    init( name:String , days:[Day] ) {
        self.name = name
        self.days = days
        self.numOfDays = days.count
    }
    
   
    
}

