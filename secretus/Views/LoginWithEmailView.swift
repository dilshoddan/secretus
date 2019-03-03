//
//  LoginWithEmailView.swift
//  secretus
//
//  Created by Home on 2/28/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import QuartzCore

class LoginWithEmailView: UIView {

    public var shouldSetupConstraints = true
    public var activityIndicator: UIActivityIndicatorView!
    public var collectionView: UIView!
    public var email: UITextField!
    public var password: UITextField!
    public var login: UIButton!
    public var regularConstraints: [NSLayoutConstraint] = []
    
    let screenSize = UIScreen.main.bounds
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
        shouldSetupConstraints = true
        SetControlDefaults()
        updateConstraints()
        
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
//            collectionView.centerIn(view: self)
            self.regularConstraints = [

                
            email.topAnchor.constraint(equalToSystemSpacingBelow: safeTopAnchor, multiplier: 5),
            email.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            email.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 4/5),
            email.heightAnchor.constraint(equalToConstant: 30),
            
            password.topAnchor.constraint(equalToSystemSpacingBelow: email.topAnchor, multiplier: 5),
            password.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            password.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 4/5),
            password.heightAnchor.constraint(equalToConstant: 30),
            
            login.topAnchor.constraint(equalToSystemSpacingBelow: password.topAnchor, multiplier: 7),
            login.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            login.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 4/5),
            login.heightAnchor.constraint(equalToConstant: 50)
            
            //Render Notes view
            ]
            
            NSLayoutConstraint.activate(regularConstraints)
            
        }
        super.updateConstraints()
    }
    
    func SetControlDefaults(){
        
        email = UITextField()
        email.placeholder = "email"
        email.layer.cornerRadius = 5
        email.clipsToBounds = true
        email.translatesAutoresizingMaskIntoConstraints = false
        email.layer.masksToBounds = true
        email.layer.borderColor = UIColor.black.cgColor
        email.layer.borderWidth = 1.0
        
        password = UITextField()
        password.isSecureTextEntry = true
        password.placeholder = "password"
        password.layer.cornerRadius = 5
        password.clipsToBounds = true
        password.translatesAutoresizingMaskIntoConstraints = false
        password.layer.masksToBounds = true
        password.layer.borderColor = UIColor.black.cgColor
        password.layer.borderWidth = 1.0
        
        login = UIButton()
        login.setTitle("login", for: .normal)
        login.backgroundColor = UIColor.green
        login.layer.cornerRadius = 5
        login.clipsToBounds = true
        login.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView = UIView()
        collectionView.layer.cornerRadius = 10
        collectionView.clipsToBounds = true
        
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(email)
        self.addSubview(password)
        self.addSubview(login)
        
       
    }

}

//                collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 5/6),
//                collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3)
