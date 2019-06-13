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
}

final class LocalFactory: HouseFactory {
    var houses: [House] {
        
        //Creamos las casas
       
        let starkSigil = Sigil(description: "Lobo Huargo", image: UIImage(named: "codeIsComing")!)
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is comming")
        
        let lannisterSigil = Sigil(description: "León rampante", image: UIImage(named: "lannister")!)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        return [starkHouse, lannisterHouse]
    }
}
