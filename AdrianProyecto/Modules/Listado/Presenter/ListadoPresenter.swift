//
//  ListadoPresenter.swift
//  CursoiOS-Proyecto1
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import Foundation

struct AnimalViewModel {
    let name: String
    let latinName: String
    let animalType: String
}

class ListadoPresenter: ListadoPresenterContract {
    
    weak var view: ListadoViewContract?
    var interactor: ListadoInteractorContract?
    var wireframe: ListadoWireframeContract?
    var fetchAnimals: ListadoProviderContract?
    
    private var animales = [Animal]() {
        didSet {
            view?.reloadData()
        }
    }
    
    var numItems: Int {
        animales.count
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchItems()
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ListadoViewCellModel {
        let item = animales[indexPath.row]
        return item.toListadoCellViewModel
    }
    
    private func fetchData() {
        interactor?.fetchItems()
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let item = animales[indexPath.row]
        
        wireframe?.navigate(to: item)
    }
    
    func didPressGetMoreButton() {
        //Manejo de memoria
        //interactor?.fetchItems()
    }
    
    deinit {
        
    }
}

extension ListadoPresenter: ListadoInteractorOutputContract {
    func didFetchFail(animals: [Animal]) {
        self.animales = animals
    }
    
    func didFetch(animals: [Animal]) {
        animales.append(contentsOf: animals)
        if (animales.firstIndex(where: { $0.name == "Chuck Norris"}) != nil) {
            
        } else {
            animales.append(chuckNorris)
        }
    }
    
}




