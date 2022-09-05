//
//  DetailViewController.swift
//  Yes&No
//
//  Created by Артур Фомин on 05.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelType?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.text = "Title"
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.text = "Story"
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.text = "Answer"
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let answerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("Показать ответ", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @objc func buttonTapped() {
        print("Button tapped")
    }

}
