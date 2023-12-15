//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Serge Bowski on 12/14/23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    let contacts = Person.getContacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        transferData()
        
    }
    
    func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach {
            if let firstNavigationVC = $0 as? FirstNavigationViewController {
                let personsListVC = firstNavigationVC.topViewController
                guard let personsListVC = personsListVC as? PersonsListViewController else {
                    return
                }
                personsListVC.contacts = contacts
            } else if let secondNavigationVC = $0 as? SecondNavigationViewController {
                let sectionContactsVC = secondNavigationVC.topViewController
                guard let sectionContactsVC = sectionContactsVC as? SectionContactsViewController else {
                    return
                }
                sectionContactsVC.contacts = contacts
            }
        }
    }
    

}
