//
//  Fact.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation

struct Fact: Codable {
    let iconURL: URL?
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case value
    }
}

extension Fact {
    var toMainFactViewModel: FactViewModel {
        FactViewModel(iconURL: iconURL, value: value)
    }
}
