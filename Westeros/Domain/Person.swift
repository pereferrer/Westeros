//
//  Person.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 11/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

final class Person{
    
    let name: String
    let house: House
    private let _alias:String?
    
    var alias: String{
        return _alias ?? ""
    }
    
    var fullName:String {
        return ("\(name) \(house.name)")
    }
    
    init(name:String, alias:String? = nil, house:House){
        self.name = name
        self._alias = alias
        self.house = house
    }
    
}

extension Person {
    var proxyForEquality: String{
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        //Patron proxy: Alguien que hace un trabajo sucio para ti que no estas dispuesto a hacer
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(alias)
        hasher.combine(house.name)
    }
}


