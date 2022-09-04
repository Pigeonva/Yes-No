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
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.backgroundColor = .systemPurple
        stack.layer.cornerRadius = 10
        
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemCyan
        let background = UIView()
        background.backgroundColor = .systemCyan
        selectedBackgroundView = background
        stackView.addArrangedSubview(cellImageView)
        stackView.addArrangedSubview(nameLabel)
        addSubview(stackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        // cellImageView constraints
        
        cellImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        cellImageView.heightAnchor.constraint(equalTo: cellImageView.widthAnchor).isActive = true
        
        // stackView constraints
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
