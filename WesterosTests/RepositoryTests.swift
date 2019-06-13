//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Pere Josep Ferrer Ventura on 13/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import XCTest

@testable import Westeros
class RepositoryTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {}
    
    func testLocalRepository(){
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalFactoryHasHouses(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
    }
    
    func testLocalFactoryHasTheCorrectHouseCount(){
        let houses = Repository.local.houses
        XCTAssertEqual(houses.count, 2)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses(){
        XCTAssertEqual(houses, houses.sort())
    }
}
