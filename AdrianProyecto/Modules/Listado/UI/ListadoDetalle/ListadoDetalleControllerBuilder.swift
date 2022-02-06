//
//  ListadoDetalleControllerBuilder.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation
import UIKit

class ListadoDetalleControllerBuilder {
    func build(viewModel: ListadoDetalleViewModel) -> UIViewController {
        
        let viewController = ListadoDetalleViewController.create()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
}
