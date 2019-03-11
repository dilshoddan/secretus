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
    public var secretusLbl: UILabel!
    public var notesTable: UITableView!
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
            regularConstraints = [
                notesTable.topAnchor.constraint(equalToSystemSpacingBelow: safeTopAnchor, multiplier: 1.0),
                notesTable.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
                notesTable.bottomAnchor.constraint(equalToSystemSpacingBelow: safeBottomAnchor, multiplier: 1.0)
                
            ]
            
            NSLayoutConstraint.activate(regularConstraints)
            //Render Notes view
            
            
        }
        super.updateConstraints()
    }
    
    func SetControlDefaults(){
        
        secretusLbl = UILabel()
        secretusLbl.text = "Notes"
        secretusLbl.font = UIFont(name: "Times New Roman", size: 30)
        secretusLbl.textColor = UIColor.white
        secretusLbl.translatesAutoresizingMaskIntoConstraints = false
        
        notesTable = UITableView()
        notesTable.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(notesTable)
        
    }
    
    
}
