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
        let file = "contacts.json"
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] //documents directory
            let pathT = dir.stringByAppendingPathComponent(file);
            let text = "some text"
            
            let data = NSJSONSerialization.dataWithJSONObject(_contacts, options: nil, error: nil)
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            //writing
            dataString!.writeToFile(pathT, atomically: false, encoding: NSUTF8StringEncoding, error: nil);
            
            //reading
            //            let newDataString = String(contentsOfFile: pathT, encoding: NSUTF8StringEncoding, error: nil)
            //            contacts =NSJSONSerialization.
            //            let myText: String? = newDataString
            //            
            
//            if (_contacts.count < 1) {
//                var jsonError: NSError?
//                let jsonData: NSData? = NSData.dataWithContentsOfMappedFile(path!) as? NSData
//                var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData!, options:NSJSONReadingOptions.MutableContainers, error:&jsonError) as NSDictionary
//                // var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSDictionary
//                //var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &jsonError ) as NSDictionary
//                
//                //            if jsonResult {
//                //                // process jsonResult
//                //            } else {
//                //                // couldn't load JSON, look at error
//                //            }
//                //            
//
        }

    }
    
    func getAllContacts() -> [Contact] {
        return _contacts.values.array
    }
}
