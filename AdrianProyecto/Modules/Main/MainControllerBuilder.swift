//
//  MainControllerBuilder.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation
import UIKit

class MainControllerBuilder {
    func build() -> UIViewController {
        let viewController = MainViewController.createFromStoryboard()
        
        let fetchRandom = FactProviderFromAPI()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let wireframe = MainWireframe()
        
        wireframe.view = viewController
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.fetchFacts = fetchRandom
        presenter.view = viewController
        interactor.mainProvider = FactProviderFromAPI()
        presenter.wireframe = wireframe
        
        return viewController
    }
}
