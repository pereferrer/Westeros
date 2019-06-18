//
//  Repository.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 13/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

final class Repository {
    
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House]{
        get
    }
    
    func house(named: String)->House?
    
    typealias HouseFilter = (House) -> Bool
    func houses(filteredBy: HouseFilter) ->[House]
}

final class LocalFactory: HouseFactory {
    
    var houses: [House] {
        
        //Creamos las casas
       
        let starkSigil = Sigil(description: "Lobo Huargo", image: UIImage(named: "codeIsComing")!)
        let lannisterSigil = Sigil(description: "León rampante", image: UIImage(named: "lannister")!)
        let targaryenSigil = Sigil(description: "Dragon tricefalo", image: UIImage(named: "targaryen")!)
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is comming", url: starkURL)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterURL)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre", url: targaryenURL)
        
        let robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        starkHouse.add(persons: robb, arya)
        lannisterHouse.add(persons: tyrion, jaime, cersei)
        targaryenHouse.add(persons: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    
    func house(named: String) -> House? {
        return houses.filter { $0.name.uppercased() == named.uppercased()}.first
    }
    
    func houses(filteredBy theFilter: (House) -> Bool) -> [House] {
        return houses.filter(theFilter)
    }
}
