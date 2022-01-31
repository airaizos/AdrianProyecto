//
//  ListPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.
//

import Foundation

class ListPresenter: ListPresenterContract {
    var view: ListViewContract?
    
    var interactor: ListInteractorContract?
    
    var wireframe: ListWireframeContract?
    
    func viewDidLoad() {
        
        interactor?.fetchItems()
    }
    
    
}
