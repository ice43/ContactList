//
//  ContactDetailsViewController.swift
//  ContactList
//
//  Created by Serge Bowski on 12/14/23.
//

import UIKit

final class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contact: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = contact.fullName
        phoneLabel.text = contact.phone
        emailLabel.text = contact.email
    }

}
