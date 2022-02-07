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
            case .failure: self.output?.didFetchFail(animals: [chuckNorris])
            }
        })
    }
}

/*
 [Animal(
    name: "Chuck Norris",
    latinName: "Carlos Ray Norris",
    activeTime: ActiveTime.chuckNorris,
    lengthMin: "length Max",
    lengthMax: "∞",
    weightMin: "weight Max",
    weightMax: "∞",
    lifespan: "Inmortal",
    habitat: "everywhere",
    diet: "",
    geoRange: "",
    imageLink: "", id: 0)])
 
 */
