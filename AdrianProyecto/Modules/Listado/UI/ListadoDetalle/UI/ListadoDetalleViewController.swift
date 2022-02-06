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
    
    static func create() -> ListadoDetalleViewController {
        return UIStoryboard(name: "ListadoDetalleViewController", bundle: .main).instantiateViewController(withIdentifier: "ListadoDetalleViewController") as! ListadoDetalleViewController
    }
    
    @IBOutlet weak var activeTimeL: UILabel! {
        didSet {
            activeTimeL.text = NSLocalizedString("listado_detalle_active_time", comment: "")
        }
    }
    @IBOutlet weak var lenghtMinL: UILabel! {
        didSet {
            lenghtMinL.text = NSLocalizedString("listado_detalle_lenght_min", comment: "")
        }
    }
    
    @IBOutlet weak var lenghtMaxL: UILabel! {
        didSet {
            lenghtMaxL.text = NSLocalizedString("listado_detalle_lenght_max", comment: "")
        }
    }
    
    @IBOutlet weak var weightMinL: UILabel! {
        didSet {
            weightMinL.text =  NSLocalizedString("listado_detalle_weight_min", comment: "")
        }
    }
    @IBOutlet weak var weightMaxL: UILabel! {
        didSet {
            weightMaxL.text = NSLocalizedString("listado_detalle_weight_max", comment: "")
        }
    }
    
    @IBOutlet weak var lifespanL: UILabel! {
        didSet {
            lifespanL.text = NSLocalizedString("listado_detalle_lifespan", comment: "")
        }
    }
    
    @IBOutlet weak var habitatL: UILabel! {
        didSet {
            habitatL.text = NSLocalizedString("listado_detalle_habitat", comment: "")
        }
    }
    
    
    @IBOutlet weak var dietL: UILabel! {
        didSet {
            dietL.text = NSLocalizedString("listado_detalle_diet", comment: "")
        }
    }
    
    @IBOutlet weak var locationL: UILabel! {
        didSet {
            locationL.text = NSLocalizedString("listado_detalle_location", comment: "")
        }
    }
    
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
        configure(with: viewModel)
    }
}

extension ListadoDetalleViewController {
    
    
    func configure(with viewModel: ListadoDetalleViewModel?) {
        guard let viewModel = viewModel else { return }
        
        imageOutlet.kf.setImage(with: viewModel.imageURL)
        nameLabel.text = viewModel.name
        latinNameLabel.text = viewModel.latinName
        activityTimeLabel.text = String("\(viewModel.activeTime)")
        lenghtMinLabel.text = viewModel.lengthMin + " ft"
        lenghtMaxLabel.text = viewModel.lengthMax + " ft"
        weightMinLabel.text = viewModel.weightMin + " lb"
        weightMaxLabel.text = viewModel.weightMax + " lb"
        lifespanLabel.text = viewModel.lifespan + " years"
        habitatLabel.text = viewModel.habitat
        dietLabel.text = viewModel.diet
        geoRangeLabel.text = viewModel.geoRange
    }
}


//50 leading 100 //entre ellas 25
