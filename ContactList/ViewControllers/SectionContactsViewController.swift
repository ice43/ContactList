//
//  SectionContactsViewController.swift
//  ContactList
//
//  Created by Serge Bowski on 12/14/23.
//

import UIKit

final class SectionContactsViewController: UITableViewController {
    var contacts: [Person]!
}

// MARK: - UITableViewDataSource
extension SectionContactsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts[section].fullName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        let contact = contacts[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0: 
            content.text = contact.phone
            content.image = UIImage(systemName: "phone")
        default:
            content.text = contact.email
            content.image = UIImage(systemName: "tray")
        }
        
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SectionContactsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
