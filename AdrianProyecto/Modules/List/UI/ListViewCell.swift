//
//  ListViewCell.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.
// ["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]
//[🦁,👨🏼‍⚕️,🕺🏼,⌨️,🔞,👠,🍔,📖,💰,🎬,🎶,🏛,🛐,⚛️,👨🏼‍🔬,🏋🏼‍♂️,🛫,🥊]

import UIKit

struct ListCellModel {
    let cellCategory: String
}
class ListViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with viewModel: ListCellModel) {
        
        //MARK: TODO porque me da eror de nil?
      //  Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
                                        
     //   iconLabel.text = viewModel.cellIcon
   //     iconLabel.text = viewModel.cellCategory
        
    }
    
}
