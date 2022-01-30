//
//  MainViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    var presenter: MainPresenterContract?
    
    @IBOutlet weak var factImage: UIImageView!
    @IBOutlet weak var factTitle: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.presenter?.viewDidLoad()
        }
    }
    
    func configure(with viewModel: FactViewModel) {
        factLabel.text = viewModel.value
        factImage.kf.setImage(with: viewModel.iconURL)
    }
}

extension MainViewController {
    static func createFromStoryboard() -> MainViewController {
        return UIStoryboard(name: "MainViewController", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
}