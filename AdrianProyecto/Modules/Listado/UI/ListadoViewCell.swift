//
//  ListadoViewCell.swift
//  AnimalesDelMundo
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import UIKit

struct TableViewCellModel {
    let name: String
    let geoRange: String
    let image: URL?
    let lenghtMax: String
    let weightMax: String
    let lifespan: String

}

struct ListadoViewCellModel {
    
    let title: String
    let description: String
    let icono: String
}

struct AnimalListCellViewModel {
    let name: String
    let geoRange: String
}

class ListadoViewCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellIcon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with viewModel: ListadoViewCellModel) {
        cellTitle.text = viewModel.title
        cellDescription.text = viewModel.description
        cellIcon.text = viewModel.icono
    }
    
}
