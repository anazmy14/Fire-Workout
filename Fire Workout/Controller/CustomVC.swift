//
//  CustomVC.swift
//  Fire Workout
//
//  Created by an on 2/19/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit

class CustomVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    var plan = Plan(name: "", days: [])
    var numOfDays = 0
    @IBOutlet weak var addBtn: ovalButton!
    
    @IBAction func addDay(_ sender: Any) {
        numOfDays += 1
        if numOfDays == 7 {
            addBtn.isEnabled = false
        }
        
        table.reloadData()
        
    }
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
     
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let lbl  = UILabel(frame: CGRect(x: 0 , y: 5, width: 100 , height: 40))
        lbl.textColor = .white
        lbl.font = UIFont(name: "HelveticaNeue-Bold" , size: 17)
        lbl.textAlignment = .left
        
        lbl.text = "  Day \(section+1)"
        view.addSubview(lbl)
        view.backgroundColor = UIColor(red : 0/255 , green: 84/255 , blue: 147/255 , alpha: 1.0)
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numOfDays
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        if (indexPath.row + 1 == tableView.numberOfRows(inSection: indexPath.section)  )  {
            let btn = UIButton()
            btn.frame = CGRect(x: addBtn.frame.origin.x, y: cell.img.frame.origin.y, width: addBtn.frame.width, height: addBtn.frame.height)
            btn.setBackgroundImage(UIImage(named: "green") , for: .normal)
            btn.setTitle("Add Exercise", for: .normal)
            cell.addSubview(btn)
        }
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
