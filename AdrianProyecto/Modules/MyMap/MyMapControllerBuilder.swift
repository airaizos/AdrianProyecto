//
//  MyMapControllerBuilder.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 4/2/22.
//

import Foundation
import UIKit


class MyMapControllerBuilder {
    func build() -> UIViewController {
        let viewController = MyMapViewController.createFromStoryboard()
       
    
        
        
        let interactor = MyMapInteractor()
        
        let presenter = MyMapPresenter(interactor: interactor)
        viewController.presenter = presenter
        presenter.view = viewController

        
        return viewController
    }
}



