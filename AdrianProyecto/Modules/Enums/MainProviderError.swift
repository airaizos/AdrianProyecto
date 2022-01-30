//
//  MainProviderError.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 30/1/22.
//

import Foundation

enum MainProviderError: Error {
case badURL, generic(Error?)
}
