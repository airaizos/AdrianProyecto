//
//  ListControllerBuilder.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation
import UIKit

class ListControllerBuilder {
    func build() -> UIViewController {
        let viewController = ListViewController.createFromStoryboard()
        
        let presenter = ListPresenter()
        let interactor = ListInteractor()
        let fetchCategories = ListProviderFromAPI()
        let wireframe = ListWireframe()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.fecthCategories = fetchCategories
        presenter.view = viewController
        interactor.ListProvider =  ListProviderFromAPI()
        
        
        return viewController
    }
}
