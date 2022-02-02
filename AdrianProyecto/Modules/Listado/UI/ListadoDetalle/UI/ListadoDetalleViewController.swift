//
//  ListadoDetalleViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import UIKit
import Kingfisher

struct ListadoDetalleViewModel {
    let imageLink: String
    let name: String
    let latinName: String
    let activeTime: ActiveTime
    let lengthMin, lengthMax, weightMin, weightMax: String
    let lifespan, habitat, diet, geoRange: String
    
    var imageURL: URL? {
        return URL(string: imageLink)
    }
}

class ListadoDetalleViewController: UIViewController {
    
    var viewModel: ListadoDetalleViewModel?

    //MARK: Outlets
  
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latinNameLabel: UILabel!
    @IBOutlet weak var activityTimeLabel: UILabel!
    @IBOutlet weak var lenghtMinLabel: UILabel!
    @IBOutlet weak var lenghtMaxLabel: UILabel!
    @IBOutlet weak var weightMinLabel: UILabel!
    @IBOutlet weak var weightMaxLabel: UILabel!
    @IBOutlet weak var lifespanLabel: UILabel!
    @IBOutlet weak var habitatLabel: UILabel!
    @IBOutlet weak var dietLabel: UILabel!
    @IBOutlet weak var geoRangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ListadoDetalleViewController {
    static func create() -> ListadoDetalleViewController {
        return UIStoryboard(name: "ListadoDetalleViewController", bundle: .main).instantiateViewController(withIdentifier: "ListadoDetalleViewController") as! ListadoDetalleViewController
    }
    
    func configure(with viewModel: ListadoDetalleViewModel?) {
        guard let viewModel = viewModel else { return }
        
        imageOutlet.kf.setImage(with: viewModel.imageURL)
        nameLabel.text = viewModel.name
        latinNameLabel.text = viewModel.latinName
        activityTimeLabel.text = String("\(viewModel.activeTime)")
        lenghtMinLabel.text = viewModel.lengthMin
        lenghtMaxLabel.text = viewModel.lengthMax
        weightMinLabel.text = viewModel.weightMin
        weightMaxLabel.text = viewModel.weightMax
        lifespanLabel.text = viewModel.lifespan
        habitatLabel.text = viewModel.habitat
        dietLabel.text = viewModel.diet
        geoRangeLabel.text = viewModel.geoRange
    }
}
