//
//  LoginViewController.swift
//  secretus
//
//  Created by Home on 2/26/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    public var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetDefaults()
        AddEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func SetDefaults(){
        loginView = LoginView(frame: self.view.bounds)
        self.view.addSubview(loginView)
        loginView.anchorIn(view: self.view)
    }

    func AddEvents(){
        loginView.loginWithFB.addTarget(self, action: #selector(loginWithFB), for: .touchUpInside)
        
        let byEmailTapped = UITapGestureRecognizer(target: self, action: #selector(LoginByEmail))
        loginView.byEmail.isUserInteractionEnabled = true
        loginView.byEmail.addGestureRecognizer(byEmailTapped)
    }
    
    @objc
    func LoginByEmail(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = MainNavigationController(rootViewController: LoginWithEmailViewController())
    }
    
    @objc
    func loginWithFB(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = MainNavigationController(rootViewController: MainTabBarController())
    }
}
