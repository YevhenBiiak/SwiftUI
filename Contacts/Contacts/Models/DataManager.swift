//
//  DataManager.swift
//  Contacts
//
//  Created by Yevhen Biiak on 30.12.2022.
//

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    let names = [
        "John", "Aaron" , "Tim" , "Nicola", "Allan",
        "Ted" , "Steven", "Carl", "Bruce" , "Sharon"
    ]
    
    let surnames = [
        "Smith" , "Dow"  , "Murphy", "Isaacson" , "Pennyworth",
        "Jankin", "Black", "Butler", "Robertson", "Williams"
    ]
    
    let emails = [
        "jjjj@mail.ru", "aaaa@mail.ru", "eeee@mail.ru", "llll@mail.ru", "pppp@mail.ru",
        "hhhh@mail.ru", "wwww@mail.ru", "mmmm@mail.ru", "ssss@mail.ru", "xxxx@mail.ru"
    ]
    
    let phones = [
        "745396026", "145036843", "287185656", "293520954", "459477625",
        "562880225", "738594072", "825654134", "645898473", "432349845"
    ]
}
