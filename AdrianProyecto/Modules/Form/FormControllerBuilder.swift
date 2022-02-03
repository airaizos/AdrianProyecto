//
//  FormControllerBuilder.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation
import UIKit

class FormControllerBuilder {
    func build() -> UIViewController {
        let viewController = FormViewController.createFromStoryboard()
        
        let presenter = FormPresenter()
        let interactor = FormInteractor()
        
        presenter.view = viewController
        viewController.presenter = presenter
        interactor.formProvider = FormProvider()
        presenter.interactor = interactor
        
        
        return viewController
    }
}
