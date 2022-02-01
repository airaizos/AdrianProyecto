//
//  QueryFactContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import Foundation
import UIKit

protocol QueryFactViewContract: UIViewController {
    var presenter: QueryFactPresenterContract? { get set }
    
    func reloadData()
}

protocol QueryFactPresenterContract {
    var view: QueryFactViewContract? { get set }
    var interactor: QueryFactInteractorContract? { get set }
    var wireframe: QueryFactWireframeContract? { get set }
    var fetchQueryFacts: QueryFactProviderContract? { get set }
    
    var numItems: Int { get }
     func viewDidLoad()
    func cellViewModel(at indexPath: IndexPath) -> QueryFactCellModel
}

protocol QueryFactInteractorContract {
    var output: QueryFactInteractorOutputContract? { get set }
    var QueryFactProvider: QueryFactProviderContract? {  get set }
    func fetchItems()
}


protocol QueryFactWireframeContract {
    var view: UIViewController? { get set }
    func navigate(to item: QueryFact)
}


protocol QueryFactInteractorOutputContract {
    
    func didFetch(queryFacts: [QueryFact])
    func didFetchFail()
}

protocol QueryFactProviderContract {
    func getItems(_ completion: @escaping (Result<[QueryFact], ProviderError>)  -> ())
}
