//
//  ListInteractor.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.
//MARK: Todo. hay que pasar el array de strings a categories

import Foundation

class ListInteractor: ListInteractorContract {

   weak var output: ListInteractorOutputContract?
    var ListProvider: ListProviderContract?
    
    func fetchItems() {
        ListProvider?.getItems({ result in
            switch result {
            case .success(let stringCategory):
                var categories = [Category]()
                
                stringCategory.forEach { category in
                    
                    categories.append(Category(category: category))
                    
                }
                self.output?.didFetch(categories: categories)
                print("datos obtenidos: \(categories)")
            case .failure: self.output?.didFetchFail()
            }
        })
    }
}


