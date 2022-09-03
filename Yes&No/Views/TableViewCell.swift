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
            guard let viewModel = viewModel else {return}
            nameLabel.text = viewModel.title
        }
    }

    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemPurple
        let background = UIView()
        background.backgroundColor = .systemPurple
        selectedBackgroundView = background
        addSubview(cellImageView)
        addSubview(nameLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        // cellImageView constraints
        
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        // nameLabel constraints
        
        nameLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: contentView.frame.height/2).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
}
