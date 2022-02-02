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
   
    //MARK: dependencias
    weak var view: ListadoViewContract?
    var interactor: ListadoInteractorContract?
    var wireframe: ListadoWireframeContract?
    var fetchAnimals: ListadoProviderContract?
    
    private var animales = [Animal]() {
        didSet {
            view?.reloadData()
            print("animales: \(animales)")
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
        
        //A donde tiene que ir
        wireframe?.navigate(to: item)
        
    }
}

extension ListadoPresenter: ListadoInteractorOutputContract {
    func didFetchFail() {
        
    }
    

    func didFetch(animals: [Animal]) {
        self.animales = animals
    }
    
}
