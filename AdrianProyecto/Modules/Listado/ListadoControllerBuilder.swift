//
//  ListadoControllerBuilder.swift
//  AnimalesDelMundo
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import Foundation
import UIKit

class ListadoControllerBuilder {
    func build() -> UIViewController {
        let viewController = ListadoViewController.createFromStoryboard()
        let fetchAnimals = NetworkListadoProvider()
        let presenter = ListadoPresenter()
        let interactor = ListadoInteractor()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.fetchAnimals = fetchAnimals
        presenter.view = viewController
        interactor.animalesProvider = NetworkListadoProvider()
        
        return viewController
    }
}
