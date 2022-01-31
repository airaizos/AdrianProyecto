//
//  ListContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.
//

import Foundation
import UIKit

protocol ListViewContract: UIViewController {
    var presenter: ListPresenterContract? { get set }
}

protocol ListPresenterContract {
    var view: ListViewContract? { get set }
    var interactor: ListInteractorContract? { get set }
    var wireframe: ListWireframeContract? { get set }
    func viewDidLoad()
}

protocol ListInteractorContract {
    var output: ListInteractorOutputContract? { get set }
    var ListProvider: ListProviderContract? { get set }
    func fetchItems()
}

protocol ListInteractorOutputContract {
    func didFetch(category: Category)
    func didFetchFail()
}

protocol ListWireframeContract {
    
}

protocol ListProviderContract {
    func getItems(_ completion: @escaping (Result<Category,ProviderError>) ->())
}
