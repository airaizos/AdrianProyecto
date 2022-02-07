//
//  ListadoInteractor.swift
//  CursoiOS-Proyecto1
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import Foundation

class ListadoInteractor: ListadoInteractorContract {
    
    var animalesProvider: ListadoProviderContract?
    weak var output: ListadoInteractorOutputContract?

    func fetchItems() {
        animalesProvider?.getAnimalListado({ result in
            switch result {
            case .success(let animales): self.output?.didFetch(animals: animales)
            case .failure(let error): self.output?.didFetchFail(animals: [Animal(name: "\(error.localizedDescription)", latinName: "", activeTime: ActiveTime.error, lengthMin: "", lengthMax: "", weightMin: "", weightMax: "", lifespan: "", habitat: "", diet: "", geoRange: "", imageLink: "", id: 0)])
            }
        })
    }
}
