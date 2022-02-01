//
//  QueryFactInteractor.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import Foundation

class QueryFactInteractor: QueryFactInteractorContract {
    var output: QueryFactInteractorOutputContract?
    
    var QueryFactProvider: QueryFactProviderContract?
    
    func fetchItems() {
        QueryFactProvider?.getItems({ result in
            switch result {
            case .success(let queryFact): self.output?.didFetch(queryFacts: queryFact)
                print("datos obtenidos: \(queryFact)")
            case .failure: self.output?.didFetchFail()
            }
        })
    }
}
