//
//  Notes.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class NotesView: UIView {
    
    public var shouldSetupConstraints = true
    public var activityIndicator: UIActivityIndicatorView!
    
    let screenSize = UIScreen.main.bounds
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
        shouldSetupConstraints = true
        SetControlDefaults()
        updateConstraints()
        
        self.backgroundColor = UIColor.red
        
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
        
    }
    
    
}
