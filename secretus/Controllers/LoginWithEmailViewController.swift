//
//  LoginWithEmailViewController.swift
//  secretus
//
//  Created by Home on 2/28/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import Firebase

class LoginWithEmailViewController: UIViewController {

    public var loginWithEmailView: LoginWithEmailView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login by email"
        SetDefaults()
        AddEvents()
        
    }
    
    func SetDefaults(){
        loginWithEmailView = LoginWithEmailView(frame: self.view.bounds)
        self.view.addSubview(loginWithEmailView)
    }
    
    func AddEvents(){
        
        loginWithEmailView.login.addTarget(self, action: #selector(LoginWithEmail), for: .touchUpInside)
    }
    
    @objc
    func LoginWithEmail(){
        if let email = loginWithEmailView.email.text, let password = loginWithEmailView.password.text,
            !(email.isEmpty) && !(password.isEmpty)
        {
            AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, loginError) in
                if success {
                    self.ShowMainPage()
                }
                else {
                    print("\(String(describing: loginError?.localizedDescription))")
                    self.AskToRegister(withEmail: email, andPassword: password)
                }
                
            }
            
        }
    }
    
    func RegisterUser(withEmail email: String, andPassword password: String) {
        AuthService.instance.registerUser(withEmail: email, andPassword: password) { (success, registerError) in
            if success {
                AuthService.instance.loginUser(withEmail: email, andPassword: password, loginComplete: { (success, loginError) in
                    if success {
                        self.ShowMainPage()
                    }
                })
            }
            else{
                self.ShowAlert(withTitle: "Register error", andMessage: registerError!.localizedDescription)
                print("Create User Error: \(registerError!.localizedDescription)")
                self.TryAgain()

            }
        }
    }

    func ShowMainPage(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: MainTabBarController())
    }
    
    func TryAgain(){
        
        self.loginWithEmailView.email.text = ""
        self.loginWithEmailView.password.text = ""
        self.loginWithEmailView.email.becomeFirstResponder()
    }
    
    func ShowAlert(withTitle title:String, andMessage message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func AskToRegister(withEmail email: String, andPassword password: String){
        
        let askToRegister = UIAlertController(title: "Could not login", message: "Would you like to register with these credentials", preferredStyle: .alert)
        askToRegister.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            self.RegisterUser(withEmail: email, andPassword: password)
        }))
        
        askToRegister.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction) in
            self.TryAgain()
        }))
        
        
        self.present(askToRegister, animated: true, completion: nil)
    }
}
