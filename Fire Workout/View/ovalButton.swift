//
//  ovalButton.swift
//  Fire Workout
//
//  Created by an on 1/22/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit

class ovalButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = frame.height / 2
        
        backgroundColor = UIColor.clear
        clipsToBounds = true
        tintColor = UIColor.white
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
       
    }
}



    



