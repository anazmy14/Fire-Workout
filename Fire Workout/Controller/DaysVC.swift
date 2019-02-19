//
//  DaysVC.swift
//  Fire Workout
//
//  Created by an on 2/18/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DaysVC: UIViewController , UITableViewDelegate , UITableViewDataSource , ChooseExercise {
    
    
    
    @IBOutlet weak var setBtn: ovalButton!
    @IBOutlet weak var table: UITableView!
    var delegate:ChoosePlan?
    var plan:Plan?
    var muscle: Muscle = .biceps
    var exerciseId: String = ""

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return plan!.numOfDays
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let lbl = UILabel()
        lbl.backgroundColor =  UIColor(red : 0/255 , green: 84/255 , blue: 147/255 , alpha: 1.0)
        lbl.textColor = .white
        lbl.font = UIFont(name: "HelveticaNeue-Bold" , size: 17)
        lbl.textAlignment = .center
        lbl.text = "  Day \(section+1)"

        
        return lbl
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        for i in 0...plan!.numOfDays {
            if section == i {
               return plan!.days[i].exerciseID.count
            }
          
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell") as! MenuCell
        let id = (muscle :  plan!.days[indexPath.section].exerciseID[indexPath.row].muscle , index : plan!.days[indexPath.section].exerciseID[indexPath.row].index )
        cell.img.setRounded()
        cell.title.getExercise(muscle: id.muscle , index: id.index )
        cell.img.getImage(muscle: id.muscle.rawValue , index: id.index)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        muscle = plan!.days[indexPath.section].exerciseID[indexPath.row].muscle
        exerciseId = "\(muscle.rawValue)\(indexPath.row)"
        let gifVC = self.storyboard?.instantiateViewController(withIdentifier: "gifVC") as! GifVC
        gifVC.delegate = self
        self.present(gifVC, animated: true , completion: nil)
        
    }
    

    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func set(_ sender: Any) {
        setBtn.isEnabled = false
        UserDefaults.standard.setValue(plan!.name , forKey: "active plan")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        plan = delegate?.selectedPlan
        if let activePlan = UserDefaults.standard.object(forKey: "active plan") as? String {
            if activePlan == plan!.name {
                setBtn.isEnabled = false
            }
        }
        
        

    }
    

    
  
 
   
    
    

}

extension UILabel {
    
    func getExercise (muscle:Muscle , index:Int  ) {
        
        let ref = Database.database().reference().child(muscle.rawValue).child( "\(index)")
        ref.observe(.value) { (data ) in
            
            if let data = data.value as? String
            {
               self.text = data
            }
        }
        
    }
    
}
