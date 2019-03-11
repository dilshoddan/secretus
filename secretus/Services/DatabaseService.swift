//
//  DatabaseService.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DatabaseService {
    static let instance = DatabaseService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_NOTES = DB_BASE.child("notes")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_NOTES: DatabaseReference {
        return _REF_NOTES
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadNote(withNote note:String, forUID uid:String, sendComplete: @escaping(_ status: Bool) -> ()){
        REF_NOTES.childByAutoId().updateChildValues(["content": note, "senderId": uid])
        sendComplete(true)
    }
    
    func getNotes(handler: @escaping(_ notes: [Notes]) -> ()){
        var notes: [Notes] = []
        REF_NOTES.observeSingleEvent(of: .value) { (notesSnapshot) in
            guard let notesSnapshot = notesSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for note in notesSnapshot {
                let content = note.childSnapshot(forPath: "content").value as! String
                //if sophisticated Model created all other child's attributes can be used
                let senderId = note.childSnapshot(forPath: "senderId").value as! String
                let note = Notes(note: content, senderId: senderId)
                notes.append(note)
            }
            
            handler(notes)
        }
    }
    
    func getUserID(forUID uid: String, handler: @escaping(_ userName: String) -> ()){
        REF_USERS.observeSingleEvent(of: .value) { userSnapshot in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
}
