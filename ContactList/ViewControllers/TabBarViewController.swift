//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Serge Bowski on 12/14/23.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        transferData()
    }
    
    private func transferData() {
        guard let firstNavigationVC = viewControllers?.first as? UINavigationController else { return }
        guard let secondNavigationVC = viewControllers?.last as? UINavigationController else { return }
        
        let contacts = Person.getContacts()
        
        let personListVC = firstNavigationVC.topViewController
        guard let personListVC = personListVC as? PersonsListViewController else { return }
        personListVC.contacts = contacts
        
        let sectionContactsVC = secondNavigationVC.topViewController
        guard let sectionContactsVC = sectionContactsVC as? SectionContactsViewController else { return }
        sectionContactsVC.contacts = contacts
    }
    

}
