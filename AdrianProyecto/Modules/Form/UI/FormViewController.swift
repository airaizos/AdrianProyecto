//
//  FormViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit

class FormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension FormViewController {
    static func createFromStoryboard() -> FormViewController {
        return UIStoryboard(name: "FormViewController", bundle: .main).instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
    }
}
