//
//  MyMapViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 4/2/22.
//

import UIKit
import MapKit

class MyMapViewController: UIViewController {

    var presenter: MyMapPresenterContract?
    
    @IBOutlet weak var MyMap: MKMapView!
    
    @IBOutlet weak var permissionLabel: UILabel!
    @IBOutlet weak var permissionButtonText: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
    }
    
    @IBAction func PermissionsButton(_ sender: UIButton) {
        presenter?.didPressPermissionsButton()
    }
}

extension MyMapViewController {
    static func createFromStoryboard() -> MyMapViewController {
        return UIStoryboard(name: "MyMapViewController", bundle: .main).instantiateViewController(withIdentifier: "MyMapViewController") as! MyMapViewController
    }
}

extension MyMapViewController: MyMapViewContract {
    
    func setAllowed() {
        DispatchQueue.main.async {
            self.permissionButtonText.isEnabled = true
            self.permissionLabel.text = "Location Allowed"
        }
    }
    
    func setNotAllowed() {
        DispatchQueue.main.async {
            self.permissionButtonText.isEnabled = true
            self.permissionLabel.text = "Location not Allowed"
        }
    }
    
    //MARK: TODO Boton open settings
    func openSettigns() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
    }
}
