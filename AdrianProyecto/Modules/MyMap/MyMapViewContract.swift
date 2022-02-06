//
//  MyMapViewContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 4/2/22.
//

import Foundation
import UIKit

protocol MyMapViewContract: UIViewController {
    
    func setAllowed()
    func setNotAllowed()
    func openSettings()
}

protocol MyMapPresenterContract: AnyObject {
    var view: MyMapViewContract? { get set }
    func didPressPermissionsButton()
}

protocol MyMapInteractorContract: AnyObject {
    var output: MyMapInteractorOutputContract? { get set }
    var currentPermission: MyMapInteractorStatus { get }
    func askPermission()
}

protocol MyMapInteractorOutputContract: AnyObject {
    func didUpdatePermissions(status: MyMapInteractorStatus)
}

enum MyMapInteractorStatus {
    case allowed, denied, unknown
}
