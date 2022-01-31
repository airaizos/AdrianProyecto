//
//  ListInteractor.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.
//

import Foundation

class ListInteractor: ListInteractorContract {
    var output: ListInteractorOutputContract?
    
    var ListProvider: ListProviderContract?
    
    func fetchItems() {
        ListProvider?.getItems({ result in
            switch result {
            case .success(let category): self.output?.didFetch(category: category)
            case .failure: self.output?.didFetchFail()
            }
        })
    }
}
