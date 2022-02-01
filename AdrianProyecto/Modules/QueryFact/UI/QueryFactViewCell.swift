//
//  QueryFactViewCell.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import UIKit

struct QueryFactCellModel {
    let cellIdLabel: String
    let cellValueLabel: String
}

class QueryFactViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with viewModel: QueryFactCellModel) {
        idLabel.text = viewModel.cellIdLabel
        valueLabel.text = viewModel.cellValueLabel
    }
    
}
