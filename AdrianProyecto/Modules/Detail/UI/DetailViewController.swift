//
//  DetailViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}

extension DetailViewController {
    static func createFromStoryboard() -> DetailViewController {
        return UIStoryboard(name: "DetailViewController", bundle: .main).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    }
}
