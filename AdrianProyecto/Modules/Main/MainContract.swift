//
//  MainContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation
import UIKit

protocol MainViewContract: UIViewController {
    var presenter: MainPresenterContract? { get set
    }
}

protocol MainPresenterContract {
    var view: MainViewContract? { get set }
    var interactor: MainInteractorContract? { get set }
    var wireframe: WireframeInteractorContract? { get set }
    
    func viewDidLoad()
}

protocol MainInteractorContract {
    var output: MainInteractorOutputContract? { get set }
    func fetchItems()
}


protocol WireframeInteractorContract {
    
}


protocol MainInteractorOutputContract {
    func didFetch(fact: Fact)
    func didFetchFail()
}


protocol MainProviderContract {
    func getMainFact(_ completion: @escaping (Result<Fact,MainProviderError>) ->())
}
