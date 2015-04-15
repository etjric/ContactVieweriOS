//
//  ContactManager.swift
//  ContactVieweriOS
//
//  Created by Eric Johnson on 4/13/15.
//  Copyright (c) 2015 Eric Johnson. All rights reserved.
//

import UIKit

private let _ourInstance = ContactManager()

class ContactManager: NSObject {
    var _contacts = [String: Contact]()
    
    //swift singleton pattern per --> http://code.martinrue.com/posts/the-singleton-pattern-in-swift
    class var sharedInstance : ContactManager {
        struct Static {
            static var instance: ContactManager?
            static var token: dispatch_once_t = 0
        }

        dispatch_once(&Static.token) {
            Static.instance = ContactManager()
        }

        return Static.instance!
    }
    
    private override init() {
        //singleton -- so we hide the constructor
    }

    
    func generateTestData() {
        addContact(Contact(name: "Malcom Reynolds", phone: "555-1234", title: "Captain", email: "email@email.com", twitterId: "@iamtwitter"))
        addContact(Contact(name: "Jayne Cobb", phone: "555-6374", title: "Muscle", email: "email@email.com", twitterId: "@iamtwitter"))
        addContact(Contact(name: "Wash", phone: "555-7263", title: "Pilot", email: "email@email.com", twitterId: "@iamtwitter"))
        addContact(Contact(name: "Kaylee", phone: "555-0987", title: "Engineer", email: "email@email.com", twitterId: "@iamtwitter"))
    }
    
    
    func deleteContact(contact: Contact) {
        _contacts.removeValueForKey(contact.id)
    }
    
    func addContact(contact: Contact) {
        _contacts[contact.id] = contact
    }
    
    func getContact(id: String) -> Contact? {
        var contactIndex: DictionaryIndex? = _contacts.indexForKey(id)?
        
        if (contactIndex == nil) {
            return nil
        }
        else {
            return _contacts[id]!
        }
    }
    
    func saveContacts() {
        let documentsPath: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        let filename: String = "contacts.plist"
        let filePath: String = documentsPath + "/" + filename

        var json: [Dictionary<String, AnyObject>] = []
        for c in _contacts.values.array {
            var jsonContact = [
                "id" : c.id,
                "name": c.name,
                "phone": c.phone,
                "title": c.title,
                "email": c.email,
                "twitterId": c.twitterId
            ]
            json.append(jsonContact)
        }
        NSKeyedArchiver.archiveRootObject(json, toFile: filePath)
    }
    
    func loadContacts() {
        let documentsPath: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        let filename: String = "contacts.plist"
        let filePath: String = documentsPath + "/" + filename

        var checkValidation = NSFileManager.defaultManager()
        
        if (checkValidation.fileExistsAtPath(filePath)) {
            let inJSON:[Dictionary<String, AnyObject>] = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as [Dictionary<String, AnyObject>]
            
            for c in inJSON {
                let name: String = c["name"] as String
                let id: String = c["id"] as String
                let title: String = c["title"] as String
                let phone: String = c["phone"] as String
                let email: String = c["email"] as String
                let twitterId: String = c["twitterId"] as String
                
                let myContact: Contact = Contact(name: name, phone: phone, title: title, email: email, twitterId: twitterId, id:id)
                addContact(myContact)
            }
        }
        else{
            generateTestData()
        }
        return
    }
    
    func getAllContacts() -> [Contact] {
        return _contacts.values.array
    }
}
