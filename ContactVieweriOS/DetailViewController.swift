//
//  DetailViewController.swift
//  ContactVieweriOS
//
//  Created by Eric Johnson on 4/11/15.
//  Copyright (c) 2015 Eric Johnson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var twitterLabel: UILabel!

    var detailItem: Contact?
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Contact = self.detailItem  {
            if let nameLabel = self.nameLabel {
                nameLabel.text = detail.name
            }
            if let titleLabel = self.titleLabel {
                titleLabel.text = detail.title
            }
            if let phoneLabel = self.phoneLabel {
                phoneLabel.text = detail.phone
            }
            if let emailLabel = self.emailLabel {
                emailLabel.text = detail.email
            }
            if let twitterLabel = self.twitterLabel {
                twitterLabel.text = detail.twitterId
            }
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
        self.configureView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editDetail" {
            let contact = detailItem
            let controller = (segue.destinationViewController) as EditViewController
            controller.detailItem = contact
        }
    }
    
    

}

