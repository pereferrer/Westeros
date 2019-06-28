//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import XCTest

@testable import Westeros
class SeasonTests: XCTestCase {
    
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
        
        episodeOneSeasonOne = Episode(titulo: "Winter Is Coming", fechaEmision: dateEpisodeOneSeasonOne, resumen: "Eddard Stark is torn between his family and an old friend when asked to serve at the side of King Robert Baratheon; Viserys plans to wed his sister to a nomadic warlord in exchange for an army.", season: seasonOne)
        episodeTwoSeasonOne = Episode(titulo: "The Kingsroad", fechaEmision: dateEpisodeTwoSeasonOne, resumen: "While Bran recovers from his fall, Ned takes only his daughters to King's Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.", season: seasonOne)
        episodeOneSeasonTwo = Episode(titulo: "The North Remembers", fechaEmision: dateEpisodeOneSeasonTwo, resumen: "Tyrion arrives at King's Landing to take his father's place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night's Watch arrive at the house of Craster.", season: seasonTwo)
        episodeTwoSeasonTwo = Episode(titulo: "The Night Lands", fechaEmision: dateEpisodeTwoSeasonTwo, resumen: "Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster's secret.", season: seasonTwo)
        
    }
    
    //Test para comprobar existencia de Season
    func testSeasonExistence(){
        XCTAssertNotNil(seasonOne)
        XCTAssertNotNil(seasonTwo)
    }
    
    //Test Para comprobar existencia de episodio
    func testEpisodesExistence(){
        XCTAssertNotNil(episodeOneSeasonOne)
        XCTAssertNotNil(episodeTwoSeasonOne)
        XCTAssertNotNil(episodeOneSeasonTwo)
        XCTAssertNotNil(episodeTwoSeasonTwo)
    }
    
    //Test de añadir 1 episodio
    func testAddEpisode(){
        XCTAssertEqual(seasonOne.countEpisodes, 0)
        seasonOne.addEpisode(episode: episodeOneSeasonOne)
        XCTAssertEqual(seasonOne.countEpisodes, 1)
        XCTAssertEqual(seasonTwo.countEpisodes, 0)
        seasonTwo.addEpisode(episode: episodeOneSeasonTwo)
        XCTAssertEqual(seasonTwo.countEpisodes, 1)
    }
    
    //Test para añadir varios episodios a la vez
    func testAddEpisodesAtOnce(){
        seasonOne.add(episodes: episodeOneSeasonOne, episodeTwoSeasonOne)
        seasonTwo.add(episodes: episodeOneSeasonTwo, episodeTwoSeasonTwo)
    }
    
    //Test para comprobar hashable
    func testSeasonConformsToHashable() {
        XCTAssertNotNil(seasonOne.hashValue)
        XCTAssertNotNil(seasonTwo.hashValue)
    }
    
    //Test para comprobar CustomStringConvertible
    func testSeasonCustomStringConvertible(){
        XCTAssertEqual(seasonOne.description, "Nombre: \(seasonOne.nombre), Fecha de lanzamiento: \(seasonOne.fechaLanzamiento), episodios: \(seasonOne.countEpisodes)")
        XCTAssertEqual(seasonTwo.description, "Nombre: \(seasonTwo.nombre), Fecha de lanzamiento: \(seasonTwo.fechaLanzamiento), episodios: \(seasonTwo.countEpisodes)")
    }
    
    //Test para comprobar equality
    func testSeasonEquality() {
        //Cuando compruebas la igualdad tienes que fijarte en : Identidad, Igualdad, Desigualdad
        
        //Identidad
        XCTAssertEqual(seasonOne, seasonOne)
        
        //Igualdad
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        guard let dateEpisodeOneSeasonOne = dateFormatter.date(from: "17-04-2011") else {
            fatalError()
        }
        let season = Season(nombre: "Season One", fechaLanzamiento: dateEpisodeOneSeasonOne)
        XCTAssertEqual(seasonOne, season)
        
        //Desigualdad
        XCTAssertNotEqual(seasonOne, seasonTwo)
    }
    
    //Test para comprobar la comparacion
    func testSeasonComparison(){
        XCTAssertLessThan(seasonOne, seasonTwo)
        XCTAssertGreaterThan(seasonTwo, seasonOne)
    }
}
