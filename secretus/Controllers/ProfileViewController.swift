//
//  ProfileViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    public var profileView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        SetDefaults()
        
    }
    
    func SetDefaults(){
        profileView = ProfileView()
        self.view.addSubview(profileView)
    }

}
