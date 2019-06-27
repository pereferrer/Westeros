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
    
    enum Houses: String{
        case StarkHouse = "STARK"
        case LannisterHouse = "LANNISTER"
        case TargaryenHouse = "TARGARYEN"
    }
    
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
        
        _ = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        _ = Person(name: "Arya", house: starkHouse)
        _ = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        _ = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        _ = Person(name: "Cersei", house: lannisterHouse)
        _ = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
//        starkHouse.add(persons: robb, arya)
//        lannisterHouse.add(persons: tyrion, jaime, cersei)
//        targaryenHouse.add(persons: dani)
        
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
        let episodeOneSeasonOne = Episode(titulo: "Winter Is Coming", fechaEmision: dateEpisodeOneSeasonOne, resumen: "Eddard Stark is torn between his family and an old friend when asked to serve at the side of King Robert Baratheon; Viserys plans to wed his sister to a nomadic warlord in exchange for an army.", season: seasonOne)
        let episodeTwoSeasonOne = Episode(titulo: "The Kingsroad", fechaEmision: dateEpisodeTwoSeasonOne, resumen: "While Bran recovers from his fall, Ned takes only his daughters to King's Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.", season: seasonOne)
        let episodeOneSeasonTwo = Episode(titulo: "The North Remembers", fechaEmision: dateEpisodeOneSeasonTwo, resumen: "Tyrion arrives at King's Landing to take his father's place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night's Watch arrive at the house of Craster.", season: seasonTwo)
        let episodeTwoSeasonTwo = Episode(titulo: "The Night Lands", fechaEmision: dateEpisodeTwoSeasonTwo, resumen: "Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster's secret.", season: seasonTwo)
        let episodeOneSeasonThree = Episode(titulo: "Valar Dohaeris", fechaEmision: dateEpisodeOneSeasonThree, resumen: "Jon is brought before Mance Rayder, the King Beyond the Wall, while the Night's Watch survivors retreat south. In King's Landing, Tyrion asks for his reward. Littlefinger offers Sansa a way out.", season: seasonThree)
        let episodeTwoSeasonThree = Episode(titulo: "Dark Wings, Dark Words", fechaEmision: dateEpisodeTwoSeasonThree, resumen: "Bran and company meet Jojen and Meera Reed. Arya, Gendry, and Hot Pie meet the Brotherhood. Jaime travels through the wilderness with Brienne. Sansa confesses her true feelings about Joffery to Margaery.", season: seasonThree)
        let episodeOneSeasonFour = Episode(titulo: "Two Swords", fechaEmision: dateEpisodeOneSeasonFour, resumen: "Tyrion welcomes a guest to King's Landing. At Castle Black, Jon stands trial. Daenerys is pointed to Meereen, the mother of all slave cities. Arya runs into an old enemy.", season: seasonFour)
        let episodeTwoSeasonFour = Episode(titulo: "The Lion and the Rose", fechaEmision: dateEpisodeTwoSeasonFour, resumen: "Joffrey and Margaery's wedding has come. Tyrion breaks up with Shae. Ramsay tries to prove his worth to his father. Bran and company find a Weirwood tree.", season: seasonFour)
        let episodeOneSeasonFive = Episode(titulo: "The Wars to Come", fechaEmision: dateEpisodeOneSeasonFive, resumen: "Cersei and Jaime adjust to a world without Tywin. Tyrion and Varys arrive at Pentos. In Meereen, a new enemy emerges. Jon is caught between two kings.", season: seasonFive)
        let episodeTwoSeasonFive = Episode(titulo:     "The House of Black and White", fechaEmision: dateEpisodeTwoSeasonFive, resumen: "Arya arrives in Braavos. Jaime takes on a secret mission. Ellaria Sand seeks revenge for Oberyn's death. Stannis makes Jon a generous offer as the Night's Watch elects a new Lord Commander. Daenerys is faced with a difficult decision.", season: seasonFive)
        let episodeOneSeasonSix = Episode(titulo: "The Red Woman", fechaEmision: dateEpisodeOneSeasonSix, resumen: "The fate of Jon Snow is revealed. Daenerys is brought before Khal Moro. Tyrion gets used to living in Meereen. Ramsay sends his dogs after Theon and Sansa. Ellaria and the Sand Snakes make their move. Cersei mourns for Myrcella.", season: seasonSix)
        let episodeTwoSeasonSix = Episode(titulo: "Home", fechaEmision: dateEpisodeTwoSeasonSix, resumen: "Bran trains with the Three-Eyed Raven. Tommen meets with Cersei. Tyrion makes a bold move. Theon leaves while at Pyke new issues arise. Ramsay's brother is born. Davos asks Melisandre for a miracle.", season: seasonSix)
        let episodeOneSeasonSeven = Episode(titulo: "Dragonstone", fechaEmision: dateEpisodeOneSeasonSeven, resumen: "Jon organizes the North's defenses. Cersei tries to even the odds. Daenerys comes home. Arya reminds the Freys the North remembers. Sam adapts to life in Oldtown. The Night King makes his way south.", season: seasonSeven)
        let episodeTwoSeasonSeven = Episode(titulo: "Stormborn", fechaEmision: dateEpisodeTwoSeasonSeven, resumen: "Daenerys receives an unexpected visitor. Jon faces resistance. Tyrion plans the conquest of Westeros. Cersei gathers her allies. Arya has a reunion with old friends. Sam risks his career and life.", season: seasonSeven)
        
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
    
    //añado test
    func house(named houseName: Houses) -> House? {
        return houses.filter { $0.name.uppercased() == houseName.rawValue.uppercased()}.first
    }
}
