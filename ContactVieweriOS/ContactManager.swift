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
    private let _contactFileName = "contacts_storage.json"
    class var Instance : ContactManager {
        return _ourInstance
    }
    
    private override init() {
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
        contact.id = NSUUID().UUIDString
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
        //turn _contacts into json
        //write it to file
    }
    
    func loadContacts() {
        //load the file
        //load _contacts from json
    }
    
    func getAllContacts() -> [Contact] {
        return _contacts.values.array
    }
}
