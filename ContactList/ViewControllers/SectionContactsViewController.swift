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
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contacts[section].fullName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.section]
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstContactCell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            content.text = contact.phone
            content.image = UIImage(systemName: "phone")
            
            cell.contentConfiguration = content
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondContactCell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            content.text = contact.email
            content.image = UIImage(systemName: "tray")
                
            cell.contentConfiguration = content
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension SectionContactsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
