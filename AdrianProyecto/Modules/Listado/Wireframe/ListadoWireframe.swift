//
//  ListadoWireframe.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation
import UIKit

class ListadoWireframe: ListadoWireframeContract {
   weak var view: UIViewController?
    
    func navigate(to animal: Animal) {
        DispatchQueue.main.async {
            let viewController = ListadoDetalleControllerBuilder().build(viewModel: animal.toListadoDetalleViewModel)
            
            if let navigationController = self.view?.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            } else {
                self.view?.present(viewController, animated: true)
            }
        }
    }
}
