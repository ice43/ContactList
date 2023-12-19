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
    
    var rows: [String] {
        [phone, email]
    }

    static func getContacts() -> [Person] {
        var persons: [Person] = []
        let dataStore = DataStore.shared
        
        let names = dataStore.names.shuffled()
        let surnames = dataStore.surnames.shuffled()
        let phones = dataStore.phones.shuffled()
        let emails = dataStore.emails.shuffled()
        
        let iterationCount = min(
            names.count,
            surnames.count,
            phones.count,
            emails.count
        )
        
        for index in 0..<iterationCount {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                phone: phones[index],
                email: emails[index]
            )
            
            persons.append(person)
        }
        
        return persons
    }
}


