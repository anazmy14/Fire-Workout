//
//  Day.swift
//  Fire Workout
//
//  Created by an on 2/18/19.
//  Copyright © 2019 an. All rights reserved.
//

import Foundation

struct Day  {
    
    var day:String
    var exerciseID:[(muscle:Muscle , index:Int )]
    
    init(day:String , exerciseID:[ (muscle:Muscle , index:Int) ] ) {
        self.day = day
        self.exerciseID = exerciseID
        
    }
    
    
}
