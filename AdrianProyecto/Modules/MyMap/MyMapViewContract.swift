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
    func openSettigns()
}

protocol MyMapPresenterContract: AnyObject {
    var view: MyMapViewContract? { get set }
    func didPressPermissionsButton()
}

protocol MyMapInteractorContract {
    var output: MyMapInteractorOutputContract? { get set }
    var currentPermission: MyMapInteractorStatus { get }
    func askPermission()
}

protocol MyMapInteractorOutputContract {
    func didUpdatePermissions(status: MyMapInteractorStatus)
}

enum MyMapInteractorStatus {
    case allowed, denied, unknown
}
