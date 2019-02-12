//
//  RegisterVC.swift
//  Fire Workout
//
//  Created by an on 2/12/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBAction func register(_ sender: Any) {
        
        if password.text != confirmPassword.text {
            displayError(message: "Must match the previous entry", controller: self)
            
            }
            
        else if email.text != "" || password.text != "" {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (result , error ) in
                
                if error != nil {
                    displayError(message: error!.localizedDescription , controller: self)
               }
                    
                else {
                    
                }
        }
       
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

func displayError ( message:String , controller:UIViewController )  {
    let alert = UIAlertController(title: "ERORR ", message: message , preferredStyle: .alert )
    alert.addAction(UIAlertAction(title: "cancel" , style: .cancel , handler: nil))
    controller.present(alert , animated: true , completion: nil)
}
