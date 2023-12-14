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
        let names = DataStore().names.shuffled()
        let surnames = DataStore().surnames.shuffled()
        let phones = DataStore().phones.shuffled()
        let emails = DataStore().emails.shuffled()
        
        let contacts = (0...9).map { contact in
            Person(
                name: names[contact],
                surname: surnames[contact],
                phone: phones[contact],
                email: emails[contact]
            )
        }
        
        return contacts
    }
}


