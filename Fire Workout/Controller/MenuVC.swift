//
//  MenuVC.swift
//  Fire Workout
//
//  Created by an on 2/12/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import FirebaseAuth

class MenuVC: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getMenuItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.img.image = UIImage(named: DataService.instance.getMenuItems()[indexPath.row].img )
        cell.title.text = DataService.instance.getMenuItems()[indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == DataService.instance.getMenuItems().count-1 {
            AuthService.deleteCurrentUser()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
            self.view.window?.rootViewController = vc
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

        }
        
        else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: DataService.instance.getMenuItems()[indexPath.row].storyboardID)
            
            self.revealViewController()?.pushFrontViewController(vc!, animated: true)
          
           
         
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 150

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
