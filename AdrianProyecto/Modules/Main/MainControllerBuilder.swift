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
        
        
        return viewController
    }
}
