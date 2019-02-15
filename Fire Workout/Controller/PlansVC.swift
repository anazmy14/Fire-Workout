//
//  PlansVC.swift
//  Fire Workout
//
//  Created by an on 2/15/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class PlansVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var menuBtn: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        return cell
    }
    

  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menuBtn.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)) , for: .touchUpInside )
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer() )
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        table.delegate = self
        table.dataSource = self
        addSegmentControl()
       
    
        }
    
    
    @IBAction func controlValueChanged( control : BetterSegmentedControl ) {
        
        print(control.index)
        
    }
    
    private func addSegmentControl () {
    let bgColor =  UIColor(red : 0/255 , green: 84/255 , blue: 147/255 , alpha: 1.0)
    let control = BetterSegmentedControl(
    frame: CGRect(x: 0, y: 140 , width: self.view.frame.width , height: 60),
    segments: LabelSegment.segments(withTitles: ["Beginner", "Intermediate", "Advanced"],
    normalFont: UIFont(name: "HelveticaNeue-Light", size: 19.0)!,
    normalTextColor: .white ,
    selectedFont: UIFont(name: "HelveticaNeue-Bold", size: 22.0)!,
    selectedTextColor: bgColor ),
    index: 0,
    options: [.backgroundColor(bgColor ),
    .indicatorViewBackgroundColor(.white)])
    control.cornerRadius = 0
    control.addTarget(self, action: #selector(self.controlValueChanged), for: .valueChanged)
    view.addSubview(control)
    
    table.topAnchor.constraint(equalTo: control.bottomAnchor).isActive = true
    
    }
    

  
}