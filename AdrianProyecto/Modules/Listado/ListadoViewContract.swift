//
//  ListadoViewContract.swift
//  CursoiOS-Proyecto1
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import Foundation
import UIKit

protocol ListadoViewContract: UIViewController {
    var presenter: ListadoPresenterContract? { get set }
    
    func reloadData()
}

protocol ListadoPresenterContract: AnyObject {
    var view: ListadoViewContract? { get set }
    var interactor: ListadoInteractorContract? { get set }
    var wireframe: ListadoWireframeContract? { get set }
    
    var numItems: Int { get }
    
    func viewDidLoad()
    func cellViewModel(at indexPath: IndexPath) -> ListadoViewCellModel
    func didSelectItem(at indexPath: IndexPath)
    func didPressGetMoreButton()
}

protocol ListadoInteractorContract: AnyObject {
    var output: ListadoInteractorOutputContract? { get set }
    func fetchItems()
}

protocol ListadoInteractorOutputContract: AnyObject {
    func didFetch(animals: [Animal])
    func didFetchFail(animals: [Animal])
}

protocol ListadoWireframeContract: AnyObject {
    var view: UIViewController? { get set }
    func navigate(to animal: Animal)
}

protocol ListadoProviderContract: AnyObject {
    func getAnimalListado(_ completion: @escaping (Result<[Animal],ListadoProviderError>) -> ())
}

