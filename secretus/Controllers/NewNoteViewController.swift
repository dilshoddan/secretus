//
//  NewNoteViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    weak var notesView: NotesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetDefaults()
        
    }
    
    func SetDefaults(){
        notesView = NotesView()
        self.view.addSubview(notesView)
    }
    
    
}

