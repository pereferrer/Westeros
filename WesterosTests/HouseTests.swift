//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Pere Josep Ferrer Ventura on 11/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import XCTest

@testable import Westeros
class HouseTests: XCTestCase {
    
    var starkSigil:Sigil!
    var lannisterSigil:Sigil!
    
    var starkHouse: House!
    var lannisterHouse:House!
    
    var robb:Person!
    var arya:Person!
    var tyrion:Person!

    override func setUp() {
        starkSigil = Sigil(description: "Lobo huargo", image: UIImage())
        lannisterSigil = Sigil(description: "León Rampante", image: UIImage())
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        robb = Person(name: "Robb", alias: "El joven Lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El gnomo", house: lannisterHouse)
    }

    override func tearDown() {
        
    }

    func testHouseExistence(){
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence(){
        let starkSigil = Sigil(description: "Lobo huargo", image: UIImage())
        XCTAssertNotNil(starkSigil)
    }
    
    
    //Given - When - Then
    func testHouseAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.addPerson(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.addPerson(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.addPerson(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.addPerson(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testHouseEquality() {
        //identidad
        XCTAssertEqual(starkHouse, starkHouse)
        //Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        XCTAssertEqual(starkHouse, jinxed)
        //Desigualdad
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
    }
}
