//
//  SplashViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {

    public var splash: SplashView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetDefaults()
        BeginTheShow()
    }
    
    func SetDefaults() {
        splash = SplashView(frame: self.view.bounds)
        self.view.addSubview(splash)
        splash.anchorIn(view: self.view)
    }
    
    func BeginTheShow(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            if Auth.auth().currentUser == nil {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let loginVC = LoginViewController()
                appDelegate.window?.rootViewController  = MainNavigationController(rootViewController: loginVC)
            }
            else {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = MainNavigationController(rootViewController: MainTabBarController())
            }
//            appDelegate.window?.rootViewController = UINavigationController(rootViewController: MainTabBarController())
        })
        
    }

}
