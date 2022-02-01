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
 //  var cellIcon: String
    /*{
        switch cellCategory {
        case "animal": return "🦁"
        case "career": return "👨🏼‍⚕️"
        case "celebrity": return "🕺🏼"
        case "dev": return "⌨️"
        case "explicit":return "🔞"
        case "fashion": return "👠"
        case "food": return"🍔"
        case "history":return "📖"
        case "money": return "💰"
        case "movie": return "🎬"
        case "music": return "🎶"
        case "political": return "🏛"
        case "religion": return "🛐"
        case "science": return "👨🏼‍🔬"
        case "sport": return "🏋🏼‍♂️"
        case "travel": return "🛫"
        default: return "🥊"
        }
     */
}
class ListViewCell: UITableViewCell {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with viewModel: ListCellModel) {
     //   iconLabel.text = viewModel.cellIcon
        categoryLabel.text = viewModel.cellCategory
        
    }
    
}
