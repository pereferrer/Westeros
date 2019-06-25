//
//  Season.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation


typealias Episodios = Set<Episode>

final class Season{
    
    let nombre: String
    let fechaLanzamiento: Date
    private var _episodios:Episodios
    
    init(nombre: String, fechaLanzamiento: Date){
        self.nombre = nombre
        self.fechaLanzamiento = fechaLanzamiento
        self._episodios = Episodios()
    }
}

extension Season {
    var countEpisodes:Int {
        return _episodios.count
    }
    
    func addEpisode(episode:Episode){
        if self == episode.season {
            _episodios.insert(episode)
        }
    }
    
    //Funciones variadicas
    func add(episodes: Episode...){
        //persons: [Person]
        episodes.forEach{addEpisode(episode: $0)}
    }
}

extension Season {
    var proxyForEquality: String {
        return ("\(nombre) \(fechaLanzamiento) \(countEpisodes)")
    }
    
    var proxyForComparison: Date{
        return fechaLanzamiento
    }
    
    var sortedEpisodes:[Episode]{
        return _episodios.sorted()
    }
}

extension Season: CustomStringConvertible{
    var description: String {
        return ("Nombre: \(nombre), Fecha de lanzamiento: \(fechaLanzamiento), episodios: \(countEpisodes)")
    }
}

extension Season: Equatable{
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality < rhs.proxyForEquality
    }
}

extension Season: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(nombre)
        hasher.combine(fechaLanzamiento)
        hasher.combine(_episodios.count)
    }
}

extension Season: Comparable{
    static func < (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
