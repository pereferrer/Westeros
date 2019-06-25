//
//  Episode.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation


final class Episode{
    
    let titulo: String
    let fechaEmision: Date
    weak var season: Season?
    
    init(titulo: String, fechaEmision: Date, season:Season){
        self.titulo = titulo
        self.fechaEmision = fechaEmision
        self.season = season
    }
}

extension Episode{
    var proxyForEquality: String{
        return ("\(titulo) \(fechaEmision) \(season?.nombre ?? "")")
    }
    
    var proxyForComparison: Date{
        return fechaEmision
    }
}

extension Episode: CustomStringConvertible{
    var description: String {
        return ("Título: \(titulo), Fecha de emisión: \(fechaEmision), Season: \(season?.nombre ?? "")")
    }
}

extension Episode: Equatable{
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality < rhs.proxyForEquality
    }
}

extension Episode: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(titulo)
        hasher.combine(fechaEmision)
        hasher.combine(season?.nombre)
    }
}

extension Episode: Comparable{
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
