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
        
        
        return viewController
    }
}
