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
    @IBOutlet weak var registerBtn: ovalButton!
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:) ) , name: UIResponder.keyboardWillShowNotification , object: nil )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:) ) , name: UIResponder.keyboardWillHideNotification , object: nil )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:) ) , name: UIResponder.keyboardWillChangeFrameNotification , object: nil )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self , name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self , name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self , name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    @objc func keyboardWillChange (notification : Notification ) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        self.view.frame.origin.y = -(keyboardRect.height - (view.frame.height - ( registerBtn.frame.origin.y + registerBtn.frame.height )  )  )
        print(notification.name)
    }
    
}







func displayError ( message:String , controller:UIViewController )  {
    let alert = UIAlertController(title: "ERORR ", message: message , preferredStyle: .alert )
    alert.addAction(UIAlertAction(title: "cancel" , style: .cancel , handler: nil))
    controller.present(alert , animated: true , completion: nil)
}
