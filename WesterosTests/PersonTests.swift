//
//  PersonTests.swift
//  WesterosTests
//
//  Created by Pere Josep Ferrer Ventura on 11/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import XCTest

@testable import Westeros
class PersonTests: XCTestCase {

    var starkSigil:Sigil!
    var lannisterSigil:Sigil!
    var starkHouse:House!
    var lannisterHouse:House!
    var ned:Person!
    var tyrion:Person!
    var starkURL:URL!
    var lannisterURL:URL!
    
    override func setUp() {
        
        starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        
        starkSigil = Sigil(description: "Lobo guardo", image: UIImage())
        lannisterSigil = Sigil(description: "León Rampante", image: UIImage())
        
        starkHouse = House(name: "Stark",
                               sigil: starkSigil,
                               words: "Winter is coming", url: starkURL
        )
        
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterURL)
        
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El gnomo", house: starkHouse)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testcharacterExistence(){
        XCTAssertNotNil(ned)
    }
    
    func testcharacterExistenceWithoutAlias(){
        let arya = Person(name: "Aryal", house: starkHouse)
        XCTAssertNotNil(arya)
        XCTAssertEqual(arya.alias, "")
    }
    
    func testPersonFullName(){
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonConformsToHashable() {
        XCTAssertNotNil(ned.hashValue)
    }
    
    func testPersonEquality() {
        //Cuando compruebas la igualdad tienes que fijarte en : Identidad, Igualdad, Desigualdad
        
        //Identidad
        XCTAssertEqual(ned, ned)
        
        //Igualdad
        let eddard = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertEqual(ned, eddard)
        
        //Desigualdad
        XCTAssertNotEqual(ned, tyrion)
    }
    
    func testAutomaticallyAddPersonToMembersOfHouse(){
        //En el valor pongo 2 debido a que en el setUp he añadido 2 personajes directamente.
        XCTAssertEqual(starkHouse.sortedMembers.count, 2)
    }
}
