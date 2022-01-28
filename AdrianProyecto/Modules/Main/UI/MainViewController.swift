//
//  MainViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

}


extension MainViewController {
    static func createFromStoryboard() -> MainViewController {
        return UIStoryboard(name: "MainViewController", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
}
