//
//  MyMapPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 4/2/22.
//

import Foundation

class MyMapPresenter {
    
    private var interactor: MyMapInteractorContract?
    
    init(interactor: MyMapInteractorContract) {
        self.interactor = interactor
    }
    
    weak var view: MyMapViewContract? {
        didSet {
            guard let status = interactor?.currentPermission else { return }
            interactor?.output = self
            didUpdatePermissions(status: status)
        }
    }
}

extension MyMapPresenter: MyMapInteractorOutputContract, MyMapPresenterContract {
    func didPressPermissionsButton() {
        guard let status = interactor?.currentPermission else { return }
        switch status {
        case .allowed, .denied: break
        case .unknown: interactor?.askPermission()
        }
    }
    
    func didUpdatePermissions(status: MyMapInteractorStatus) {
        switch status {
        case .allowed: view?.setAllowed()
        case .denied, .unknown: view?.setNotAllowed()
        }
    }
}
