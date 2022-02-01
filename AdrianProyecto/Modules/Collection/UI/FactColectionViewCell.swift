//
//  FactColectionViewCell.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
// collectionCell


import UIKit

struct FactCollectionViewModel {
    let imageURL: URL?
    let value: String
    let query: String
}

class FactColectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellValue: UILabel!
    
    @IBOutlet weak var cellQuery: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: FactCollectionViewModel) {
        cellImage.kf.setImage(with: viewModel.imageURL)
    }
    

}
