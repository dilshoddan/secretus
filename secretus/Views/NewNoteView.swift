//
//  NewNoteView.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class NewNoteView: UIView {
    
    public var shouldSetupConstraints = true
    public var activityIndicator: UIActivityIndicatorView!
    public var secretusLbl: UILabel!
    
    let screenSize = UIScreen.main.bounds
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
        shouldSetupConstraints = true
        SetControlDefaults()
        updateConstraints()
        
        self.backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            secretusLbl.centerIn(view: self)
            
            //Render Notes view
            
            
        }
        super.updateConstraints()
    }
    
    func SetControlDefaults(){
        secretusLbl = UILabel()
        secretusLbl.text = "New Note"
        secretusLbl.font = UIFont(name: "Times New Roman", size: 30)
        secretusLbl.textColor = UIColor.white
        secretusLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(secretusLbl)
        
        
    }
}

