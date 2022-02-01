//
//  QueryFact.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import Foundation

struct QueryFact: Codable {
    let resultado: [Resultado]
    
    enum CodingKeys: String, CodingKey {
       case resultado = "result"
    }
}

// MARK: - Result
struct Resultado: Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id, updatedAt: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}

extension QueryFact {
    var toQueryFactCellViewModel: QueryFactCellModel {
        QueryFactCellModel(cellIdLabel: Resultado.CodingKeys.id.rawValue, cellValueLabel: Resultado.CodingKeys.value.rawValue)
    }
}
