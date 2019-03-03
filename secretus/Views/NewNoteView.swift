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
    public var regularConstraints: [NSLayoutConstraint] = []
    public var secretusLbl: UILabel!
    public var note: UITextView!
    public var noteTranslate: UITextView!
    public var record: UIButton!
    
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
            regularConstraints = [
                note.topAnchor.constraint(equalToSystemSpacingBelow: self.safeTopAnchor, multiplier: 6),
                note.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
//                note.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                note.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3/9),
                
                noteTranslate.topAnchor.constraint(equalToSystemSpacingBelow: note.bottomAnchor, multiplier: 1),
                noteTranslate.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
//                noteTranslate.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                noteTranslate.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3/9),
                
                record.topAnchor.constraint(equalToSystemSpacingBelow: noteTranslate.bottomAnchor, multiplier: 1),
                record.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
                record.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                record.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/9)
            ]
                
            NSLayoutConstraint.activate(regularConstraints)
            
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
        
        note = UITextView()
        note.text = "recording here"
        note.layer.masksToBounds = true
        note.layer.borderColor = UIColor.black.cgColor
        note.layer.borderWidth = 0.2
        note.translatesAutoresizingMaskIntoConstraints = false
        
        noteTranslate = UITextView()
        noteTranslate.text = "translation here"
        noteTranslate.layer.masksToBounds = true
        noteTranslate.layer.borderColor = UIColor.black.cgColor
        noteTranslate.layer.borderWidth = 0.2
        noteTranslate.translatesAutoresizingMaskIntoConstraints = false
        
        record = UIButton()
        record.setTitle("Start Recording", for: .normal)
        record.backgroundColor = UIColor.green
        record.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        self.addSubview(note)
        self.addSubview(noteTranslate)
        self.addSubview(record)
        self.backgroundColor = UIColor.lightGray
        
        
        
    }
}

