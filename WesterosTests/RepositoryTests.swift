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
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses(){
        let houses = Repository.local.houses
        XCTAssertEqual(houses, houses.sorted())
    }
    
    func testLocalRepositoryReturnHouseByNameCaseInsensitively(){
        let stark = Repository.local.house(named: "stark")
        XCTAssertNotNil(stark)
        
        let lannister = Repository.local.house(named: "lannisTEr")
        XCTAssertNotNil(lannister)
        
        let keepCoding = Repository.local.house(named: "KeepCoding")
        XCTAssertNil(keepCoding)
    }
    
    func testLocalRepositoryHouseFiltering(){
        let filteredHouseList = Repository.local.houses(filteredBy: { house in
            house.count == 1
        })
        XCTAssertEqual(filteredHouseList.count, 1)
        
        /*let list = Repository.local.houses(filteredBy: { house in
            house.words == "Se acerca el invierno"
        })
        XCTAssertEqual(list.count, 1)*/
    }
    
    //añado test para comprobar que los episodios se devuelven ordenados.
    func testLocalRepositoryReturnsSortedArrayOSeasons(){
        let seasons = Repository.local.seasons
        XCTAssertEqual(seasons, seasons.sorted())
    }
    
    //añado test para comprobar que la función de filtrado devuelve un valor correcto
    func testLocalRepositorySeasonFiltering(){
        
        let filteredSeasonList = Repository.local.seasons(filteredBy: { season in
            season.nombre == "Season One"
        })
        XCTAssertEqual(filteredSeasonList.count, 1)
    }
    
    //Test Para Probar el punto 8
    func testLocalRepositoryReturnHouseTypeSafeAndAutocomplete(){
        let stark = Repository.local.house(named: .StarkHouse)
        XCTAssertNotNil(stark)
        
        let lannister = Repository.local.house(named: .LannisterHouse)
        XCTAssertNotNil(lannister)
        
        let targaryen = Repository.local.house(named: .TargaryenHouse)
        XCTAssertNotNil(targaryen)
    }
}
