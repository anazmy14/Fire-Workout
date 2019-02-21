//
//  CustomVC.swift
//  Fire Workout
//
//  Created by an on 2/19/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit

class CustomVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    var sections:[Section] = []
    var plan = Plan(name: "", days: [])
    var numOfDays = 0
    @IBOutlet weak var addBtn: ovalButton!
    
    @IBOutlet weak var menuBtn: UIButton!
    
 
    
    @IBAction func addDay(_ sender: Any) {
        numOfDays += 1
        sections.append(Section())
        if numOfDays == 7 {
            addBtn.isEnabled = false
        }
        table.reloadData()
        
    }
    @IBOutlet weak var table: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numOfDays
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (sections[section].isOpened == false ) {
        return 1
        }
        else {
            return sections[section].exerciseID.count+2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "section_cell", for: indexPath) as! MenuCell
            cell.title.text = "Day \(indexPath.section+1)"
            if (sections[indexPath.section].isOpened) {
                cell.img.image = UIImage(named: "downArrow")
            }
            else {
                cell.img.image = UIImage(named: "rightArrow")
            }
            return cell

        }
        else if (indexPath.row == sections[indexPath.section].exerciseID.count+1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "add_cell", for: indexPath) as! AddExerciseCell
            cell.add.addTarget(self, action: #selector(addExercise(_:)), for: .touchUpInside)
            
            return cell
        }
        
        
        else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.title.text = "exercise"
        cell.img.image = UIImage(named: "back")
            return cell
        }
     
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            if (sections[indexPath.section].isOpened) {
            sections[indexPath.section].isOpened = false
            }
        
            else {
                sections[indexPath.section].isOpened = true
            }
            table.reloadSections( [indexPath.section] , with: UITableView.RowAnimation.fade )
          }
            
        else {
            
            
            
        }
    }
    
    @IBAction func addExercise (_ sender: Any) {
       print("hi")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)) , for: .touchUpInside )
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer() )
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        table.delegate = self
        table.dataSource = self
        
    }
    

  
}

extension CustomVC {
    struct Section {
        var isOpened = false
        var exerciseID:[String] = []
        
        }
}
