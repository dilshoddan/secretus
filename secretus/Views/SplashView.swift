//
//  Splash.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class SplashView: UIView {

    public var shouldSetupConstraints = true
    public var secretusLbl: UILabel!
    
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
            
            
            //Render Notes view
            
            
        }
        super.updateConstraints()
    }
    
    func SetControlDefaults(){
        secretusLbl = UILabel()
        secretusLbl.text = "Secretus Helper"
        secretusLbl.font = UIFont(name: "Times New Roman", size: 30)
        secretusLbl.textColor = UIColor.white
        secretusLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(secretusLbl)
        NSLayoutConstraint.activate([
            secretusLbl.widthAnchor.constraint(equalToConstant: 250),
            secretusLbl.widthAnchor.constraint(equalTo: secretusLbl.heightAnchor),
            secretusLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            secretusLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
//        testView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(testView)
//        NSLayoutConstraint.activate([
//            testView.widthAnchor.constraint(equalToConstant: 64),
//            testView.widthAnchor.constraint(equalTo: testView.heightAnchor),
//            testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            ])
//        self.testView = testView
        
        self.backgroundColor = UIColor.gray
        
    }

}
