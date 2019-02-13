//
//  ExercisesVC.swift
//  Fire Workout
//
//  Created by an on 2/13/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


protocol chosenExercise  {
    var muscle:Muscle {get set}
    var exerciseId:String {get set}
}



class ExercisesVC: UIViewController , UITableViewDelegate , UITableViewDataSource , chosenExercise  {
    @IBOutlet weak var muscleName: UILabel!
    @IBOutlet weak var table: UITableView!
    var delegate:chosenMuscle?
    var exerciseId: String = "biceps0"
    var exercises:[String] = []
    var muscle:Muscle = .biceps
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MuscleCell
        cell.img.setRounded()
        cell.img.downloadImage(muscle: muscle.rawValue , index: indexPath.row )
        cell.title.text = exercises[indexPath.row]
        
        return cell

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to_gif" {
            let GifVC = segue.destination as! GifVC
            GifVC.delegate = self
        }
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        exerciseId = muscle.rawValue + "\(indexPath.row)"
        performSegue(withIdentifier: "to_gif", sender: self)
    }
    
 
 
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        muscle = delegate!.muscle
        muscleName.text = muscle.rawValue
        print( muscle.rawValue )
        getData()
        
     
    }
    

    func getData () {
        
        let ref = Database.database().reference().child(muscle.rawValue)
        ref.observe(.value) { (data ) in
            
            if let data = data.value as? [String]
            {
                print(data)
                self.exercises = data
                self.table.reloadData()
            }
        }
}
}

    extension UIImageView  {
        
        func downloadImage ( muscle:String , index:Int    )
        {
            let ref = Storage.storage().reference().child(muscle+"JPG").child("\(muscle)\(index).jpg")
            
            print("\(muscle)\(index).jpg")
            ref.getData(maxSize: 1*1024*1024) { (data , error ) in
                if error != nil
                {
                    print ( error.debugDescription )
                }
                else
                {
                    DispatchQueue.main.async
                        {
                            self.image = UIImage (data: data!)
                    }
                }
                
            }
        }
        

    
}
