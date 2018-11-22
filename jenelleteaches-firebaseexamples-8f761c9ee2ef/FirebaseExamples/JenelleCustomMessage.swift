//
//  JenelleCustomMessage.swift
//  FirebaseExamples
//
//  Created by parrot on 2018-11-18.
//  Copyright © 2018 room1. All rights reserved.
//

import Foundation
import MessageKit

class JenelleCustomMessage:MessageType {

    let name:String!
    let messageText:String!
    
    var sender: Sender
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    init(name:String, messageText:String) {
        self.name = name;
        self.messageText = messageText;
        
        self.sender = Sender(id: self.name, displayName: self.name)
        self.sentDate = Date();
        self.messageId = "jenelle-id"
        self.kind = MessageKind.text(self.messageText)
    }
    
}
