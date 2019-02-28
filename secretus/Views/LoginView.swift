//
//  LoginView.swift
//  secretus
//
//  Created by Home on 2/26/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class LoginView: UIView {

    public var shouldSetupConstraints = true
    public var secretus: UILabel!
    public var login: UILabel!
    public var loginWithFB: UIButton!
    public var loginWithG: UIButton!
    public var or: UILabel!
    public var byEmail: UILabel!
//    public var collectionView: UICollectionView!
    public var collectionView: ShadowView!
    public var regularConstraints: [NSLayoutConstraint] = []
    
    let screenSize = UIScreen.main.bounds
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
        shouldSetupConstraints = true
        SetControlDefaults()
        updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            let margins = self.layoutMarginsGuide
            let guide = self.safeAreaLayoutGuide
            self.regularConstraints = [
                secretus.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                secretus.topAnchor.constraint(equalToSystemSpacingBelow: self.safeTopAnchor, multiplier: 10),
                secretus.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
                
                collectionView.topAnchor.constraint(equalToSystemSpacingBelow: secretus.topAnchor, multiplier: 10),
                collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3/4),
                collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2),
                
                login.topAnchor.constraint(equalToSystemSpacingBelow: collectionView.topAnchor, multiplier: 3),
                login.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
                login.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 3/4),

                loginWithFB.topAnchor.constraint(equalToSystemSpacingBelow: login.topAnchor, multiplier: 7),
                loginWithFB.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
                loginWithFB.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 3/4),
                loginWithFB.heightAnchor.constraint(equalTo: login.heightAnchor, multiplier: 2),
                
                loginWithG.topAnchor.constraint(equalToSystemSpacingBelow: loginWithFB.topAnchor, multiplier: 8),
                loginWithG.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
                loginWithG.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 3/4),
                loginWithG.heightAnchor.constraint(equalTo: login.heightAnchor, multiplier: 2),
                
                or.topAnchor.constraint(equalToSystemSpacingBelow: loginWithG.topAnchor, multiplier: 11),
                or.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
                or.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 3/4),
                
                
                byEmail.topAnchor.constraint(equalToSystemSpacingBelow: or.topAnchor, multiplier: 7),
                byEmail.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
                byEmail.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 3/4)


            ]
            
            NSLayoutConstraint.activate(self.regularConstraints)
            
            
            //Render Notes view
            
            
        }
        super.updateConstraints()
    }
    
    
    func SetControlDefaults(){
        
        secretus = UILabel()
        secretus.textAlignment = NSTextAlignment.center
        secretus.text = "Secretus"
        secretus.font = .systemFont(ofSize:24)
        secretus.textColor = UIColor.white
        secretus.translatesAutoresizingMaskIntoConstraints = false
        
        login = UILabel()
        login.textAlignment = NSTextAlignment.center
        login.text = "Login"
        login.font = .systemFont(ofSize: 24)
        login.textColor = UIColor.white
        login.translatesAutoresizingMaskIntoConstraints = false
        
        loginWithFB = UIButton()
        loginWithFB.setTitle("Login with FB", for: .normal)
        loginWithFB.titleLabel?.font = .systemFont(ofSize: 22)
        loginWithFB.backgroundColor = UIColor.blue
        loginWithFB.layer.cornerRadius = 5
        loginWithFB.clipsToBounds = true
        loginWithFB.translatesAutoresizingMaskIntoConstraints = false
        
        loginWithG = UIButton()
        loginWithG.setTitle("Login with G+", for: .normal)
        loginWithG.titleLabel?.font = .systemFont(ofSize: 22)
        loginWithG.backgroundColor = UIColor.red
        loginWithG.layer.cornerRadius = 10
        loginWithG.clipsToBounds = true
        loginWithG.translatesAutoresizingMaskIntoConstraints = false
        
        or = UILabel()
        or.textAlignment = NSTextAlignment.center
        or.text = "OR"
        or.font = .systemFont(ofSize: 24)
        or.textColor = UIColor.white
        or.translatesAutoresizingMaskIntoConstraints = false
        
        byEmail = UILabel()
        byEmail.textAlignment = NSTextAlignment.center
        byEmail.text = "by email"
        byEmail.font = .systemFont(ofSize: 22)
        byEmail.textColor = UIColor.white
        byEmail.translatesAutoresizingMaskIntoConstraints = false
        
//        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView = ShadowView()
        collectionView.backgroundColor = UIColor.gray
        collectionView.layer.cornerRadius = 10
        collectionView.clipsToBounds = true
        
        collectionView.addSubview(login)
        collectionView.addSubview(loginWithFB)
        collectionView.addSubview(loginWithG)
        collectionView.addSubview(or)
        collectionView.addSubview(byEmail)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(secretus)
        self.addSubview(collectionView)
        
        
        
        self.backgroundColor = UIColor.darkGray
        
        
    }
}
