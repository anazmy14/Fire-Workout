//
//  PlansVC.swift
//  Fire Workout
//
//  Created by an on 2/15/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit

class PlansVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        return cell
    }
    

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var menuBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)) , for: .touchUpInside )
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer() )
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
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
