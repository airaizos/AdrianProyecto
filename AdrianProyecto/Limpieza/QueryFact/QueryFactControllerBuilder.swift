//
//  QueryFactControllerBuilder.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import Foundation
import UIKit

class QueryFactControllerBuilder{
    func build() -> UIViewController {
        
        let viewController = QueryFactViewController.createFromStoryboard()
        
        let presenter = QueryFactPresenter()
        let interactor = QueryFactInteractor()
        let fetchQueryFact = QueryFactProviderFromAPI()
        let wireframe = QueryFactWireframe()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.fetchQueryFacts = fetchQueryFact
        presenter.view = viewController
        interactor.QueryFactProvider = QueryFactProviderFromAPI()
        
        return viewController
    }
}
