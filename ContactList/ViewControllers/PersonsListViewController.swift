//
//  PersonsListViewController.swift
//  ContactList
//
//  Created by Serge Bowski on 12/14/23.
//

import UIKit

final class PersonsListViewController: UITableViewController {
    
    let contacts = Person.getContacts().shuffled()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailsVC = segue.destination as? ContactDetailsViewController else {
            return
        }
        detailsVC.contact = contacts[indexPath.row]
    }
}

// MARK: - Table view data source
extension PersonsListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        
        cell.contentConfiguration = content
        return cell
    }
}
