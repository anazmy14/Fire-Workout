//
//  ExercisesVC.swift
//  Fire Workout
//
//  Created by an on 2/12/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit

protocol chosenMuscle {
    var muscle:Muscle {get set}
}

class MusclesVC: UIViewController , UITableViewDataSource , UITableViewDelegate , chosenMuscle {
   
 
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var table: UITableView!
    var muscle: Muscle = .biceps

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  DataService.instance.getMuscles().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.img.image = UIImage(named: DataService.instance.getMuscles()[indexPath.row].rawValue )
        cell.title.text = DataService.instance.getMuscles()[indexPath.row].rawValue.uppercased()
        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to_exercises" {
            let ExercisesVC = segue.destination as! ExercisesVC
            ExercisesVC.delegate = self
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           muscle = DataService.instance.getMuscles()[indexPath.row]
           performSegue(withIdentifier: "to_exercises", sender: self)
    }
   


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)) , for: .touchUpInside )
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer() )
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
         table.delegate = self
         table.dataSource = self
           }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
