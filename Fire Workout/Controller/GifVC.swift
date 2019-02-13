//
//  GifVC.swift
//  Fire Workout
//
//  Created by an on 2/13/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit
import FirebaseStorage
import FLAnimatedImage

class GifVC: UIViewController  {
    var delegate:chosenExercise?
    var exerciseId: String = "biceps0"
    var muscle:Muscle = .biceps
    

    @IBOutlet weak var img: FLAnimatedImageView!
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseId = delegate!.exerciseId
        muscle = delegate!.muscle
        getGif()
    }
    

    func getGif() {
        
        let ref = Storage.storage().reference().child(muscle.rawValue).child( exerciseId+".gif")
        
        print(exerciseId + ".gif")
        ref.getData(maxSize: 2*1024*1024) { (data , error ) in
            if error != nil
            {
                print ( error.debugDescription )
            }
            else
            {
                DispatchQueue.main.async
                    {
                        let gif = FLAnimatedImage(animatedGIFData: data)
                        self.img.animatedImage = gif

                }
            }
            
        }
        
    }
    
    
    
}
