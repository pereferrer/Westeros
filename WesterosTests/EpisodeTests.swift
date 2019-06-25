//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import XCTest

@testable import Westeros
class EpisodeTests: XCTestCase {

    var seasonOne: Season!
    var seasonTwo: Season!
    
    var episodeOneSeasonOne: Episode!
    var episodeTwoSeasonOne: Episode!
    
    var episodeOneSeasonTwo: Episode!
    var episodeTwoSeasonTwo: Episode!
    
    override func setUp() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        guard let dateEpisodeOneSeasonOne = dateFormatter.date(from: "17-04-2011") else {
            fatalError()
        }
        guard let dateEpisodeTwoSeasonOne = dateFormatter.date(from: "24-04-2011") else {
            fatalError()
        }
        guard let dateEpisodeOneSeasonTwo = dateFormatter.date(from: "01-04-2012") else {
            fatalError()
        }
        guard let dateEpisodeTwoSeasonTwo = dateFormatter.date(from: "08-04-2012") else {
            fatalError()
        }
        
        seasonOne = Season(nombre: "Season One", fechaLanzamiento: dateEpisodeOneSeasonOne)
        seasonTwo = Season(nombre: "Season Two", fechaLanzamiento: dateEpisodeOneSeasonTwo)
        
        episodeOneSeasonOne = Episode(titulo: "Winter Is Coming", fechaEmision: dateEpisodeOneSeasonOne, season: seasonOne)
        episodeTwoSeasonOne = Episode(titulo: "The Kingsroad", fechaEmision: dateEpisodeTwoSeasonOne, season: seasonOne)
        episodeOneSeasonTwo = Episode(titulo: "The North Remembers", fechaEmision: dateEpisodeOneSeasonTwo, season: seasonTwo)
        episodeTwoSeasonTwo = Episode(titulo: "The Night Lands", fechaEmision: dateEpisodeTwoSeasonTwo, season: seasonTwo)
        
        seasonOne.add(episodes: episodeOneSeasonOne, episodeTwoSeasonOne)
        seasonTwo.add(episodes: episodeOneSeasonTwo, episodeTwoSeasonTwo)
    }
    
    //Test para comprobar existencia de episodio
    func testEpisodesExistence(){
        XCTAssertNotNil(episodeOneSeasonOne)
        XCTAssertNotNil(episodeTwoSeasonOne)
        XCTAssertNotNil(episodeOneSeasonTwo)
        XCTAssertNotNil(episodeTwoSeasonTwo)
    }
    //Test Para comprobar existencia de Season
    func testSeasonExistence(){
        XCTAssertNotNil(seasonOne)
        XCTAssertNotNil(seasonTwo)
    }
    
    //Test para comprobar que el episodio esta asignado a una season
    func testEpisodeHasSeason(){
        XCTAssertNotNil(episodeOneSeasonOne.season)
        XCTAssertNotNil(episodeTwoSeasonOne.season)
        XCTAssertNotNil(episodeOneSeasonTwo.season)
        XCTAssertNotNil(episodeTwoSeasonTwo.season)

    }
    //Test para comprobar equality
    func testEpisodeEquality() {
        //Cuando compruebas la igualdad tienes que fijarte en : Identidad, Igualdad, Desigualdad
        
        //Identidad
        XCTAssertEqual(episodeOneSeasonOne, episodeOneSeasonOne)
        
        //Igualdad
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        guard let dateEpisodeOneSeasonOne = dateFormatter.date(from: "17-04-2011") else {
            fatalError()
        }
        let episode = Episode(titulo: "Winter Is Coming", fechaEmision: dateEpisodeOneSeasonOne, season: seasonOne)
        XCTAssertEqual(episodeOneSeasonOne, episode)
        
        //Desigualdad
        XCTAssertNotEqual(episodeOneSeasonOne, episodeTwoSeasonTwo)
    }
    
    //Test para comprobar la comparacion
    func testEpisodeComparison(){
        XCTAssertLessThan(episodeOneSeasonOne, episodeTwoSeasonTwo)
        XCTAssertGreaterThan(episodeTwoSeasonTwo, episodeOneSeasonOne)
    }
    
    //Test para comprobar hashable
    func testEpisodeConformsToHashable() {
        XCTAssertNotNil(episodeOneSeasonOne.hashValue)
        XCTAssertNotNil(episodeTwoSeasonOne.hashValue)
        XCTAssertNotNil(episodeOneSeasonTwo.hashValue)
        XCTAssertNotNil(episodeTwoSeasonTwo.hashValue)
    }
    
    //Test para comprobar CustomStringConvertible
    
    //Test para comprobar CustomStringConvertible
    func testSeasonCustomStringConvertible(){
        XCTAssertEqual(episodeOneSeasonOne.description, "Título: \(episodeOneSeasonOne.titulo), Fecha de emisión: \(episodeOneSeasonOne.fechaEmision), Season: \(episodeOneSeasonOne.season?.nombre ?? "")")
        XCTAssertEqual(episodeTwoSeasonOne.description, "Título: \(episodeOneSeasonOne.titulo), Fecha de emisión: \(episodeOneSeasonOne.fechaEmision), Season: \(episodeOneSeasonOne.season?.nombre ?? "")")
    }
}
