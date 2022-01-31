//
//  Category.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.
// ["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]
//[🦁,👨🏼‍⚕️,🕺🏼,⌨️,🔞,👠,🍔,📖,💰,🎬,🎶,🏛,🛐,⚛️,👨🏼‍🔬,🏋🏼‍♂️,🛫]

// es un array de strings...
import Foundation

struct Category: Decodable {
    
    let category: [String]
}
