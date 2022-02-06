//
//  MyMapInteractor.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 4/2/22.
//

import Foundation
import CoreLocation

class MyMapInteractor: NSObject {
   weak var output: MyMapInteractorOutputContract?
    
    private let locationManager: CLLocationManager
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
    }
}

extension MyMapInteractor: MyMapInteractorContract {
    
    var currentPermission: MyMapInteractorStatus {
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse: return .allowed
        case .restricted, .denied: return .denied
        case  .notDetermined : return .unknown
        @unknown default: return .unknown
        }
    }
    
    func askPermission() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}

extension MyMapInteractor: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        output?.didUpdatePermissions(status: currentPermission)
    }
}
