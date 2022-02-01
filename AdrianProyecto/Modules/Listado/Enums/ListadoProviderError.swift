//
//  ListadoProviderError.swift
//  CursoiOS-Proyecto1
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import Foundation

enum ListadoProviderError: Error {
    case badUrl, generic(Error?),unableToFindFile, parseError(Error?)
}
