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
    public var secretus: UILabel!
    
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
            secretus.centerIn(view: self)
            
            //Render Notes view
            
            
        }
        super.updateConstraints()
    }
    
    func SetControlDefaults(){
        secretus = UILabel()
        secretus.text = "Secretus Helper"
        secretus.font = UIFont(name: "Times New Roman", size: 30)
        secretus.textColor = UIColor.white
        secretus.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(secretus)
        
        self.backgroundColor = UIColor.gray
        
    }

}
