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
    
    private var categories = [Category]()
    
    var numCategories: Int {
        categories.count
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchItems()
    }
}


extension ListPresenter: ListInteractorOutputContract {
    func didFetch(categories: [Category]) {
        self.categories = categories
    }
    
    func didFetchFail() {
        
    }
}

extension ListPresenter {
    func cellViewModel(at indexPath: IndexPath) -> ListCellModel {
        let item = categories[indexPath.row]
        
        return item.toListCellViewModel
    }
    
    
    func didSelectItem(at indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        wireframe?.navigate(to: category)
        
    }
}
