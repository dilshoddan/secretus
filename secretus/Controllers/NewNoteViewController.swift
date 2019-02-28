//
//  NewNoteViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    var newNoteView: NewNoteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "New note"
        SetDefaults()
        
    }
    
    func SetDefaults(){
        newNoteView = NewNoteView(frame: self.view.bounds)
        self.view.addSubview(newNoteView)
        newNoteView.anchorIn(view: self.view)
    }
    
    
}

