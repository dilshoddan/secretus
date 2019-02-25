//
//  SplashViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

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
    }
    
    func BeginTheShow(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = UINavigationController(rootViewController: MainTabBarController())
        })
        
    }

}
