//
//  MainContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation
import UIKit

protocol MainViewContract: UIViewController {
    var presenter: MainPresenterContract? { get set }
    func configure(with viewModel: FactViewModel)
}

protocol MainPresenterContract: AnyObject {
    var view: MainViewContract? { get set }
    var interactor: MainInteractorContract? { get set }
    var wireframe: MainWireframeContract? { get set }
    
    func viewDidLoad()
    func didPressRandomFact()
}

protocol MainInteractorContract: AnyObject {
    var output: MainInteractorOutputContract? { get set }
    func fetchItems()
}

protocol MainWireframeContract: AnyObject {
    var view: UIViewController? { get set }
}

protocol MainInteractorOutputContract: AnyObject {
    func didFetch(fact: Fact)
    func didFetchFail()
}

protocol MainProviderContract: AnyObject {
    func getMainFact(_ completion: @escaping (Result<Fact,ProviderError>) ->())
}
