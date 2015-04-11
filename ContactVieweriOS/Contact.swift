//
//  Contact.swift
//  ContactVieweriOS
//
//  Created by Eric Johnson on 4/11/15.
//  Copyright (c) 2015 Eric Johnson. All rights reserved.
//

import Foundation

class Contact: NSObject {
    
    var name:String
    var phone:String
    var title:String
    var email:String
    var twitterId:String
    
    init(name:String, phone:String, title:String, email:String, twitterId:String) {
        self.name = name
        self.phone = phone
        self.title = title
        self.email = email
        self.twitterId = twitterId
    }
    
}