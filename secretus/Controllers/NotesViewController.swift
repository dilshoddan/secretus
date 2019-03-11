//
//  ViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    public var notesView: NotesView!
    public var notes: [Notes] = []
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DatabaseService.instance.getNotes{ notesArray in
            self.notes = notesArray.reversed()
            self.notesView.notesTable.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Notes"
        SetDefaults()
        
    }
    
    func SetDefaults(){
        notesView = NotesView(frame: self.view.bounds)
        self.view.addSubview(notesView)
        notesView.anchorIn(view: self.view)
        
        notesView.notesTable.delegate = self
        notesView.notesTable.dataSource = self
        notesView.notesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.note
        DatabaseService.instance.getUserID(forUID: note.senderId) { returnedUsername in
            print(returnedUsername)
            
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

