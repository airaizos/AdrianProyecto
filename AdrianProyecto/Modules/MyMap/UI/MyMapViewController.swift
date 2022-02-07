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
    
    @IBOutlet weak var permissionButtonText: UIButton! {
        didSet {
            permissionButtonText.setTitle(NSLocalizedString("my_map_permission_button_text", comment: ""), for: .normal)
        }
    }
    
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
            self.permissionLabel.text = NSLocalizedString("my_map_permission_label_allowed", comment: "")
                }
            }
    
    func setNotAllowed() {
        DispatchQueue.main.async {
            self.permissionButtonText.isEnabled = true
            self.permissionLabel.text = NSLocalizedString("my_map_permission_label_not_allowed", comment: "")
        }
    }
    
    func openSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
    }
}
