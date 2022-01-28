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
        
        
        return viewController
    }
}
