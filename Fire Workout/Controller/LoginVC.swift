//
//  LoginVC.swift
//  Fire Workout
//
//  Created by an on 2/12/19.
//  Copyright © 2019 an. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper

class LoginVC: UIViewController , UITextFieldDelegate  {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIStackView!
    
    @IBAction func login(_ sender: Any) {
        if email.text != "" || password.text != ""  {
            Auth.auth().signIn(withEmail: email.text! , password: password.text!) { (result , error ) in
                if error != nil {
                    displayError(message: error!.localizedDescription , controller: self)
                }
                else {
                    AuthService.saveCurrentUser( email : self.email.text! , password : self.password.text!  )
                    self.performSegue(withIdentifier: "to_muscles", sender: self)
                }
                
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email.resignFirstResponder()
        password.resignFirstResponder()
        return true
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        email.delegate = self
        password.delegate = self
        
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
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
        self.view.frame.origin.y = -(keyboardRect.height - (view.frame.height - ( loginBtn.frame.origin.y + loginBtn.frame.height )  )  )
        }
        else {
            self.view.frame.origin.y = 0
            
        }
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
