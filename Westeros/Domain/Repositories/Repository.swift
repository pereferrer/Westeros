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
    
    //se añade test en RepositoryTests
    var seasons: [Season]{
        
        //Creo las fechas de los episodios
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
        
        guard let dateEpisodeOneSeasonThree = dateFormatter.date(from: "31-03-2013") else {
            fatalError()
        }
        guard let dateEpisodeTwoSeasonThree = dateFormatter.date(from: "07-04-2013") else {
            fatalError()
        }
        
        guard let dateEpisodeOneSeasonFour = dateFormatter.date(from: "06-04-2014") else {
            fatalError()
        }
        guard let dateEpisodeTwoSeasonFour = dateFormatter.date(from: "13-04-2014") else {
            fatalError()
        }
        
        guard let dateEpisodeOneSeasonFive = dateFormatter.date(from: "12-04-2015") else {
            fatalError()
        }
        guard let dateEpisodeTwoSeasonFive = dateFormatter.date(from: "19-04-2015") else {
            fatalError()
        }
        
        guard let dateEpisodeOneSeasonSix = dateFormatter.date(from: "24-04-2016") else {
            fatalError()
        }
        guard let dateEpisodeTwoSeasonSix = dateFormatter.date(from: "01-05-2016") else {
            fatalError()
        }
        
        guard let dateEpisodeOneSeasonSeven = dateFormatter.date(from: "16-07-2017") else {
            fatalError()
        }
        guard let dateEpisodeTwoSeasonSeven = dateFormatter.date(from: "23-07-2017") else {
            fatalError()
        }
        
        //Creo las temporadas
        let seasonOne = Season(nombre: "Season One", fechaLanzamiento: dateEpisodeOneSeasonOne)
        let seasonTwo = Season(nombre: "Season Two", fechaLanzamiento: dateEpisodeOneSeasonTwo)
        let seasonThree = Season(nombre: "Season Three", fechaLanzamiento: dateEpisodeOneSeasonThree)
        let seasonFour = Season(nombre: "Season Four", fechaLanzamiento: dateEpisodeOneSeasonFour)
        let seasonFive = Season(nombre: "Season Five", fechaLanzamiento: dateEpisodeOneSeasonFive)
        let seasonSix = Season(nombre: "Season Six", fechaLanzamiento: dateEpisodeOneSeasonSix)
        let seasonSeven = Season(nombre: "Season Seven", fechaLanzamiento: dateEpisodeTwoSeasonSeven)
        
        //Creo los episodios por temporadas
        let episodeOneSeasonOne = Episode(titulo: "Winter Is Coming", fechaEmision: dateEpisodeOneSeasonOne, season: seasonOne)
        let episodeTwoSeasonOne = Episode(titulo: "The Kingsroad", fechaEmision: dateEpisodeTwoSeasonOne, season: seasonOne)
        let episodeOneSeasonTwo = Episode(titulo: "The North Remembers", fechaEmision: dateEpisodeOneSeasonTwo, season: seasonTwo)
        let episodeTwoSeasonTwo = Episode(titulo: "The Night Lands", fechaEmision: dateEpisodeTwoSeasonTwo, season: seasonTwo)
        let episodeOneSeasonThree = Episode(titulo: "Valar Dohaeris", fechaEmision: dateEpisodeOneSeasonThree, season: seasonThree)
        let episodeTwoSeasonThree = Episode(titulo: "Dark Wings, Dark Words", fechaEmision: dateEpisodeTwoSeasonThree, season: seasonThree)
        let episodeOneSeasonFour = Episode(titulo: "Two Swords", fechaEmision: dateEpisodeOneSeasonFour, season: seasonFour)
        let episodeTwoSeasonFour = Episode(titulo: "The Lion and the Rose", fechaEmision: dateEpisodeTwoSeasonFour, season: seasonFour)
        let episodeOneSeasonFive = Episode(titulo: "The Wars to Come", fechaEmision: dateEpisodeOneSeasonFive, season: seasonFive)
        let episodeTwoSeasonFive = Episode(titulo:     "The House of Black and White", fechaEmision: dateEpisodeTwoSeasonFive, season: seasonFive)
        let episodeOneSeasonSix = Episode(titulo: "The Red Woman", fechaEmision: dateEpisodeOneSeasonSix, season: seasonSix)
        let episodeTwoSeasonSix = Episode(titulo: "Home", fechaEmision: dateEpisodeTwoSeasonSix, season: seasonSix)
        let episodeOneSeasonSeven = Episode(titulo: "Dragonstone", fechaEmision: dateEpisodeOneSeasonSeven, season: seasonSeven)
        let episodeTwoSeasonSeven = Episode(titulo: "Stormborn", fechaEmision: dateEpisodeTwoSeasonSeven, season: seasonSeven)
        
        //añado los episodios a sus respectivas temporadas
        seasonOne.add(episodes: episodeOneSeasonOne, episodeTwoSeasonOne)
        seasonTwo.add(episodes: episodeOneSeasonTwo, episodeTwoSeasonTwo)
        seasonThree.add(episodes: episodeOneSeasonThree, episodeTwoSeasonThree)
        seasonFour.add(episodes: episodeOneSeasonFour, episodeTwoSeasonFour)
        seasonFive.add(episodes: episodeOneSeasonFive, episodeTwoSeasonFive)
        seasonSix.add(episodes: episodeOneSeasonSix, episodeTwoSeasonSix)
        seasonSeven.add(episodes: episodeOneSeasonSeven, episodeTwoSeasonSeven)
        
        return [seasonOne, seasonTwo].sorted()
    }
    
    func house(named: String) -> House? {
        return houses.filter { $0.name.uppercased() == named.uppercased()}.first
    }
    
    func houses(filteredBy theFilter: (House) -> Bool) -> [House] {
        return houses.filter(theFilter)
    }
    
    //se añade test en RepositoryTests
    func seasons(filteredBy filter: (Season) ->Bool) -> [Season]{
        return seasons.filter(filter)
    }
}
