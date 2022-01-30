//
//  MainViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    

}


extension MainViewController {
    static func createFromStoryboard() -> MainViewController {
        return UIStoryboard(name: "MainViewController", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
}
