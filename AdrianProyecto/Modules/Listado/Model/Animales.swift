//
//  Animales.swift
//  AnimalesDelMundo
//
//  Created by Adrian Iraizos Mendoza on 21/1/22.
// Hasta 10 animales random
// https://zoo-animal-api.herokuapp.com/animals/rand/10
// un animal random
// https://zoo-animal-api.herokuapp.com/animals/rand

//lenght: ft
//weight: punds

import Foundation
import SwiftUI

struct Animal: Codable {
    let name, latinName: String
    let activeTime: ActiveTime
    let lengthMin, lengthMax, weightMin, weightMax: String
    let lifespan, habitat, diet, geoRange: String
    let imageLink: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case latinName = "latin_name"
        
        case activeTime = "active_time"
        case lengthMin = "length_min"
        case lengthMax = "length_max"
        case weightMin = "weight_min"
        case weightMax = "weight_max"
        case lifespan, habitat, diet
        case geoRange = "geo_range"
        case imageLink = "image_link"
        case id
    }
}

enum ActiveTime: String, Codable {
    case diurnal = "Diurnal"
    case nocturnal = "Nocturnal"
    case error = "Error"
}

typealias Animals = [Animal]

extension Animal {
    var imageURL: URL? {
        guard let iURL = URL(string: imageLink) else {
            return  URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/26/T_tetradactyla_1.jpg")}
        return iURL
    }
    
    var toTableCellViewModel: TableViewCellModel {
        
        TableViewCellModel(name: name,  geoRange: geoRange, image: imageURL, lenghtMax: lengthMax, weightMax: weightMax, lifespan: lifespan)
    }
    
    var toAnimalListCellViewModel: AnimalListCellViewModel {
        AnimalListCellViewModel(name: name, geoRange: geoRange)
    }
    
    var toListadoCellViewModel: ListadoViewCellModel {
        ListadoViewCellModel(title: name, description: latinName, icono: imageURL)
    }
    
    var toListadoDetalleViewModel: ListadoDetalleViewModel {
        ListadoDetalleViewModel(imageLink: imageLink, name: name, latinName: latinName, activeTime: activeTime, lengthMin: lengthMin, lengthMax: lengthMax, weightMin: weightMin, weightMax: weightMax, lifespan: lifespan, habitat: habitat, diet: diet, geoRange: geoRange)
    }
}
