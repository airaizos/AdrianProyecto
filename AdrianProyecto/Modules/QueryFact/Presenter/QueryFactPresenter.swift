//
//  QueryFactPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import Foundation

class QueryFactPresenter: QueryFactPresenterContract {
    
    var view: QueryFactViewContract?
    var interactor: QueryFactInteractorContract?
    var wireframe: QueryFactWireframeContract?
    var fetchQueryFacts: QueryFactProviderContract?
    
    var numItems: Int {
        queryFacts.count
    }
    
    private var queryFacts = [QueryFact]() {
        didSet {
            view?.reloadData()
        }
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchItems()
    }
    
    func cellViewModel(at indexPath: IndexPath) -> QueryFactCellModel {
        let item = queryFacts[indexPath.row]
        return item.toQueryFactCellViewModel
    }
}

extension QueryFactPresenter: QueryFactInteractorOutputContract {
    
    func didFetch(queryFacts: [QueryFact]) {
        self.queryFacts = queryFacts
        print("presenter:\(self.queryFacts[0])")
    }
    func didFetchFail() {
        
    }
    
}
