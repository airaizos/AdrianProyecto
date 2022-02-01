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
    func reloadData()
}

protocol ListPresenterContract {
    var view: ListViewContract? { get set }
    var interactor: ListInteractorContract? { get set }
    var wireframe: ListWireframeContract? { get set }
    
    var numCategories: Int { get }
    
    func viewDidLoad()
    
    func cellViewModel(at indexPath: IndexPath) -> ListCellModel
    func didSelectItem(at indexPath: IndexPath)
}

protocol ListInteractorContract {
    var output: ListInteractorOutputContract? { get set }
    var ListProvider: ListProviderContract? { get set }
    func fetchItems()
}

protocol ListInteractorOutputContract: AnyObject {
 //   func didFetch(categories: [String])
    func didFetch(categories: [Category])
    func didFetchFail()
}

protocol ListWireframeContract {
    var view: UIViewController? { get set }
    func navigate(to item: Category)
}

protocol ListProviderContract {
    func getItems(_ completion: @escaping (Result<[String],ProviderError>) ->())
}
