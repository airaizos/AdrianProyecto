//
//  ListViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
// CategoryCell

import UIKit

class ListViewController: UIViewController, ListViewContract {
    
    var presenter: ListPresenterContract?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }


}

extension ListViewController {
    static func createFromStoryboard() -> ListViewController {
        return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
    }
}
