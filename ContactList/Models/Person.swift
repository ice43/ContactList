//
//  Person.swift
//  ContactList
//
//  Created by Serge Bowski on 12/14/23.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let phone: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }

    static func getContacts() -> [Person] {
        let contacts = (0...9).map { contact in
            Person(
                name: DataStore().names[contact],
                surname: DataStore().surnames[contact],
                phone: DataStore().phones[contact],
                email: DataStore().emails[contact]
            )
        }
        
        return contacts.shuffled()
    }
}


