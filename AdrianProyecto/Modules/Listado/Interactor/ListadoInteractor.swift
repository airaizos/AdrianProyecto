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
            case .failure(let error): self.output?.didFetchFail(animals: [Animal(
                name: "Chuck Norris",
                latinName: "Carlos Ray Norris",
                activeTime: ActiveTime.always,
                lengthMin: "∞",
                lengthMax: "∞",
                weightMin: "∞",
                weightMax: "∞",
                lifespan: "Inmortal",
                habitat: "everywhere",
                diet: "superheroes, villians, planets, galaxies...",
                geoRange: "Universe",
                imageLink: "https://upload.wikimedia.org/wikipedia/commons/b/b1/Chuck_Norris%2C_The_Delta_Force_1986.jpg", id: 0)])
            }
        })
    }
}
