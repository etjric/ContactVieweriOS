//
//  Contact.swift
//  ContactVieweriOS
//
//  Created by Eric Johnson on 4/11/15.
//  Copyright (c) 2015 Eric Johnson. All rights reserved.
//

import Foundation

class Contact {
    
    var id: String
    var name:String
    var phone:String
    var title:String
    var email:String
    var twitterId:String
    
    init(name:String, phone:String, title:String, email:String, twitterId:String) {
        self.id = NSUUID().UUIDString
        self.name = name
        self.phone = phone
        self.title = title
        self.email = email
        self.twitterId = twitterId
    }
    
    convenience init(name:String, phone:String, title:String, email:String, twitterId:String, id:String) {
        self.init(name: name, phone: phone, title: title, email: email, twitterId: twitterId)
        self.id  = id
    }
}