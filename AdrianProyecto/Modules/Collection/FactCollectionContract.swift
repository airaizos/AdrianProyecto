//
//  FactCollectionContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import Foundation
import UIKit

protocol FactCollectionViewContract: UIViewController {
    var presenter: FactCollectionPresenterContract? { get set }
    
    func reloadData()
}


protocol FactCollectionPresenterContract {
    var view: FactCollectionViewContract? { get set }
    var interactor: FactCollectionInteractorContract? { get set }
    var wireframe: FactCollectionWireframeContract? { get set }
    
}

protocol FactCollectionInteractorContract {
    var output: FactCollectionInteractorOutputContract? { get set }
    var FactCollectionProvider: FactCollectionProviderContract? {  get set }
}


protocol FactCollectionWireframeContract {
    
}


protocol FactCollectionInteractorOutputContract {
    
}

protocol FactCollectionProviderContract {
    func getItems(_ completion: @escaping (Result<[QueryFact], ProviderError>) -> ())
}
