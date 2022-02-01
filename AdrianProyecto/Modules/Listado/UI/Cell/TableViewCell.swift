//
//  TableViewCell.swift
//  AnimalesDelMundo
//
//  Created by Adrian Iraizos Mendoza on 21/1/22.
//Identifier: cellTable

import UIKit
import Kingfisher
/*
struct TableViewCellModel {
    let name: String
    let geoRange: String
    let image: URL?
    let lenghtMax: String
    let weightMax: String
    let lifespan: String

}
*/
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var geoRangeLabel: UILabel!
    
    @IBOutlet weak var lenghtMaxLabel: UILabel!
    @IBOutlet weak var weightMaxLabel: UILabel!
    @IBOutlet weak var lifespanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: TableViewCellModel) {
        cellImage.kf.setImage(with: viewModel.image)
        nameLabel.text = viewModel.name
        animalTypeLabel.text = "type"
        geoRangeLabel.text =  viewModel.geoRange
        lenghtMaxLabel.text =  viewModel.lenghtMax
        weightMaxLabel.text =  viewModel.weightMax
        lifespanLabel.text = viewModel.lifespan
        
    }
}

