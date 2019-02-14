//
//  AuthService.swift
//  Fire Workout
//
//  Created by an on 2/14/19.
//  Copyright © 2019 an. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class AuthService {
    
    static func saveCurrentUser ( email:String , password:String ) {
        let _: Bool = KeychainWrapper.standard.set(password , forKey: email)
        UserDefaults.standard.set(email , forKey: "user")
    }
    
    static func deleteCurrentUser ( ) {
        let email =  UserDefaults.standard.string(forKey:
            "user")
        let _ : Bool = KeychainWrapper.standard.removeObject(forKey: email!)
            UserDefaults.standard.removeObject(forKey: "user")
        
        
    }
    
    
        
    
    
}
