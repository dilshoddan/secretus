//
//  MainTabBarControllerViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notesView = NotesViewController()
        notesView.title = "Notes"
        let notesItem:UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 0)
//        notesItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        notesView.tabBarItem = notesItem
        
        let newNoteView = NewNoteViewController()
        newNoteView.title = "New Note"
        let newNoteItem:UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.featured, tag: 1)
//        newNoteView.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        newNoteView.tabBarItem = newNoteItem
        
        
        //viewControllers = [loginVC, skipsVC, searchVC, notificationsVC, messagesVC]
        
        viewControllers = [notesView, newNoteView]
        self.tabBar.tintColor = UIColor.lightGray
    }

}
