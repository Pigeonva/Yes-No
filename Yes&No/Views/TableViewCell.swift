//
//  TableViewCell.swift
//  Yes&No
//
//  Created by Артур Фомин on 03.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    weak var viewModel: TableViewCellViewModelType? {
        didSet {
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
