//
//  MessageKitExampleViewController.swift
//  FirebaseExamples
//
//  Created by parrot on 2018-11-18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import MessageKit



class MessageKitExampleViewController: MessagesViewController, MessagesDataSource {
    
    
    var messages: [JenelleCustomMessage] = []
    
    // MARK:  Functions required by MessageKit
    // --------------------------------------
    func currentSender() -> Sender {
        return Sender(id: "jenelle-test", displayName: "jenelle-test")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    

    
    
    
    
    
    
    // MARK: MessageKit functions
    // ---------------------------
    
    
    
    
    
    
    
    
    
    //--- none
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
