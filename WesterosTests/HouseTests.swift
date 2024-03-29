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
    
    var starkURL:URL!
    var lannisterURL:URL!

    override func setUp() {
        
        starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        
        starkSigil = Sigil(description: "Lobo huargo", image: UIImage())
        lannisterSigil = Sigil(description: "León Rampante", image: UIImage())
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterURL)
        
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
        //Al haber realizado el punto 11 este test carece de sentido ya que aplicaria el test testAutomaticallyAddPersonToMembersOfHouse en el fichero de test de Person
        
//        XCTAssertEqual(starkHouse.count, 0)
//
//        starkHouse.addPerson(person: robb)
//        XCTAssertEqual(starkHouse.count, 1)
//
//        starkHouse.addPerson(person: arya)
//        XCTAssertEqual(starkHouse.count, 2)
//
//        starkHouse.addPerson(person: arya)
//        XCTAssertEqual(starkHouse.count, 2)
//
//        starkHouse.addPerson(person: tyrion)
//        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testHouseEquality() {
        //Este test lo he modifico debido al punto 11 y como la starkHouse ya tenía miembros y el proxyEquality también le hacemos un  count de los miembros indicaba que jinxed era distinto a stark.
        //identidad
        XCTAssertEqual(starkHouse, starkHouse)
        //Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
        _ = Person(name: "Robb", alias: "El joven Lobo", house: jinxed)
        _ = Person(name: "Arya", house: jinxed)
        XCTAssertEqual(starkHouse, jinxed)
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
    }
    
    func testHouseAddPersonsAtOnce(){
        //Al haber realizado el punto 11 este test carece de sentido ya que aplicaria el test testAutomaticallyAddPersonToMembersOfHouse en el fichero de test de Person
//        starkHouse.add(persons: robb, arya, tyrion)
//        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testHouseSortedMembersReturnsASortedListOfMembers(){
        
        starkHouse.add(persons: robb,arya)
        XCTAssertEqual(starkHouse.sortedMembers, [arya,robb])
    }
}
