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

final class House {
    
    let name: String
    let sigil: Sigil
    let words: Words
    
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words){
        
        self.name = name
        self.sigil = sigil
        self.words = words
        _members = Members()
    }
}

extension House {
    var count:Int {
        return _members.count
    }
    
    func addPerson(person:Person){
        if self == person.house {
            _members.insert(person)
        }
        
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
