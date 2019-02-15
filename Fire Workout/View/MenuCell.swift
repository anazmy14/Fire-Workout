//
//  MenuCell.swift
//  Fire Workout
//
//  Created by an on 2/13/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
   
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var title:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true

    
    }

}
