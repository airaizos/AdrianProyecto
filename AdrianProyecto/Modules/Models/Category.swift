//
//  Category.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.

import Foundation

struct Category: Decodable {
    
    let category: String
}

extension Category {
    
    var toListCellViewModel: ListCellModel {
        ListCellModel(cellCategory: category)
    }
}
