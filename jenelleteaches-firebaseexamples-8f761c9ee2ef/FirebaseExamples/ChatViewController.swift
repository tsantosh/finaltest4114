//
//  ChatViewController.swift
//  FirebaseExamples
//
//  Created by parrot on 2018-11-18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ChatViewController: UIViewController {

    // MARK: Outlets
    // ------------------------------------
    @IBOutlet weak var chatMessageTextBox: UITextField!
    @IBOutlet weak var messagesTextBox: UITextView!
    
    
    // MARK: Initialize firestore variable
    // ------------------------------------
    var db:Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup firestore variable
        db = Firestore.firestore()
        
        // OPTIONAL:  Required when dealing with dates that are stored in Firestore
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        
        
        // monitor the database for any incoming changes
        db.collection("chats").addSnapshotListener {
            (querySnapshot, error) in
            
            if (querySnapshot == nil) {
                print("Error fetching document: \(error!)")
                return
            }
            
            // UI: Clear the textbox
            //self.messagesTextBox.text = ""
            
            // Get only what is changed:
            querySnapshot?.documentChanges.forEach({
                (diff) in
                
                if (diff.type == DocumentChangeType.added) {
                    // something was added
                    let data = diff.document.data()     // get the document that was added
                    let user = data["username"] as! String
                    let msg = data["message"] as! String
                    print(user)
                    print(msg)
                    
                    self.messagesTextBox.text = self.messagesTextBox.text + "\(user): \(msg) \n"
                }
                
                if (diff.type == DocumentChangeType.modified) {
                    // something was modified
                }
                
                if (diff.type == DocumentChangeType.removed) {
                    // soemthing was deleted
                }
            })
            
            
            
            
            /* get All
            for doc in querySnapshot.documents! {
                let source = doc.metadata.hasPendingWrites ? "Local" : "Server"
                print("\(source) data: \(doc.data() ?? [:])")
                
                let data = doc.data()
                let user = data["username"] as! String
                let msg = data["message"] as! String
                print(user)
                print(msg)
                
                self.messagesTextBox.text = self.messagesTextBox.text + "\(user): \(msg) \n"
            }
            */
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Functions
    
    @IBAction func sendChatPressed(_ sender: Any) {
        let chatRef = db.collection("chats")
        chatRef.document().setData([
            "message": self.chatMessageTextBox.text!,
            "username": "JenelleBot"
        ])
        print("Message sent!")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
