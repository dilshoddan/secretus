//
//  AuthService.swift
//  secretus
//
//  Created by Home on 2/28/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String,
                      userCreationComplete: @escaping(_ status: Bool, _ error: Error?)->()
        ){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let user = result?.user  else {
                userCreationComplete(false, error)
                return
            }

            //FIRAuthErrorCode(rawValue: error!._code)
            let userData = ["provider": user.providerID, "email": user.email ]
            DatabaseService.instance.createDBUser(uid: user.uid, userData: userData as Dictionary<String, Any>)
            userCreationComplete(true, nil)
            
        }
        
    }
    
    func loginUser(withEmail email: String, andPassword password: String,
                   loginComplete: @escaping(_ status: Bool, _ error: Error?)->()
        ){
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                loginComplete(false, error)
                return
            }
            
            loginComplete(true, nil)
        }
        
    }
}
