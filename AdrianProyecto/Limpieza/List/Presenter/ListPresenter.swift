//
//  ListPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.

import Foundation

class ListPresenter: ListPresenterContract {
    
    var view: ListViewContract?
    var interactor: ListInteractorContract?
    var wireframe: ListWireframeContract?
    var fecthCategories: ListProviderContract?
    
    private var categories = [Category]() {
        didSet {
            view?.reloadData()
        }
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchItems()
    }
    
    var numCategories: Int {
        categories.count
    }
    //porque no pasa por aqui??
    func cellViewModel(at indexPath: IndexPath) -> ListCellModel {
        let item = categories[indexPath.row]
        
        print("item: \(item)")
        return item.toListCellViewModel
        
    }
}


extension ListPresenter: ListInteractorOutputContract {
    func didFetch(categories: [Category]) {
        self.categories = categories
        print("presenter:\(self.categories[1])")
    }
    
    func didFetchFail() {
        
    }
}

extension ListPresenter {

    
    
    func didSelectItem(at indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        wireframe?.navigate(to: category)
        
    }
}
