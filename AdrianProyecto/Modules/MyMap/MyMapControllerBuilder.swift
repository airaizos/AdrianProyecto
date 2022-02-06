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

        viewController.presenter = buildPresenter()
        
        return viewController
    }
}

private extension MyMapControllerBuilder {
    func buildInteractor() -> MyMapInteractorContract{
        MyMapInteractor()
    }
    func buildPresenter() -> MyMapPresenterContract {
        MyMapPresenter(interactor: buildInteractor())
    }
}
