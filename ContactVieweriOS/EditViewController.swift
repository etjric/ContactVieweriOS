//
//  EditViewController.swift
//  ContactVieweriOS
//
//  Created by Eric Johnson on 4/11/15.
//  Copyright (c) 2015 Eric Johnson. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var twitterField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    var detailItem: Contact?
    
    func configureView() {
        
        //we have a contact so we go into edit mode...
        if (detailItem != nil) {
            // Update the user interface for the detail item.
            if let detail: Contact = self.detailItem  {
                if let nameField = self.nameField {
                    nameField.text = detail.name
                }
                if let titleField = self.titleField {
                    titleField.text = detail.title
                }
                if let phoneField = self.phoneField {
                    phoneField.text = detail.phone
                }
                if let emailField = self.emailField {
                    emailField.text = detail.email
                }
                if let twitterField = self.twitterField {
                    twitterField.text = detail.twitterId
                }
            }
        }
        //we don't so we go into Add mode
        else{
            self.title = "Add Contact"
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveContact(sender: AnyObject) {
        //we have a detailItem, so we are in Edit mode
        if (detailItem != nil) {
            if let detail: Contact = self.detailItem  {
                detail.name = nameField.text
                detail.phone = phoneField.text
                detail.title = titleField.text
                detail.email = emailField.text
                detail.twitterId = twitterField.text
                
            }
        }
        
        // we're adding the contact...
        else {
            let detail: Contact = Contact(name: nameField.text, phone: phoneField.text, title: titleField.text, email: emailField.text, twitterId: twitterField.text)
            ContactManager.sharedInstance.addContact(detail)
        }
        //save and go back to prev...
        ContactManager.sharedInstance.saveContacts()
        navigationController?.popViewControllerAnimated(true)

    }
}
