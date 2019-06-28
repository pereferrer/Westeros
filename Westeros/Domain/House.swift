//
//  House.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 11/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

typealias Words = String
typealias Members = Set<Person>

 class House {
    
    let name: String
    let sigil: Sigil
    let words: Words
    let wikiURL: URL
    
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words, url:URL){
        
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiURL = url
        _members = Members()
    }
}

extension House {
    var count:Int {
        return _members.count
    }
    
    var sortedMembers:[Person]{
        return _members.sorted()
    }
    
    func addPerson(person:Person){
        if self == person.house {
            _members.insert(person)
        }
    }
    //Funciones variadicas
    func add(persons: Person...){
        //persons: [Person]
        persons.forEach{addPerson(person: $0)}
    }
}

extension House {
    var proxyForEquality: String {
        return ("\(name) \(words) \(count)")
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

extension House : Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension House : Comparable {
    static func < (lhs: House, rhs: House) -> Bool {
        //alguna logica para definir cuando el lhs < rhs
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
