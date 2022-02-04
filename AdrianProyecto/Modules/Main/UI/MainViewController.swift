//
//  MainViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController, MainViewContract {

    var presenter: MainPresenterContract?

    
    @IBOutlet weak var factImage: UIImageView!
    @IBOutlet weak var factTitle: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var RandomFact: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.presenter?.viewDidLoad()
    }
    
    func configure(with viewModel: FactViewModel) {
        factLabel.text = viewModel.value
        factImage.kf.setImage(with: viewModel.iconURL)
    }
    
    @IBAction func RandomFact(_ sender: UIButton) {
        
        //MARK: TODO boton luego get randomFact, translate
    }
}

extension MainViewController {
    static func createFromStoryboard() -> MainViewController {
        return UIStoryboard(name: "MainViewController", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
}
