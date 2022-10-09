//
//  DetailViewController.swift
//  Yes&No
//
//  Created by Артур Фомин on 05.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel = DetailViewModel()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.isHidden = true
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let answerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать ответ", for: .normal)
        button.setTitle("Скрыть ответ", for: .selected)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setup()
        
        viewModel.story.bind {[weak self] model in
            self?.titleLabel.text = model?.title
            self?.storyLabel.text = model?.story
            self?.answerLabel.text = model?.answer
        }
        
        view.backgroundColor = .systemPurple
        view.addSubview(titleLabel)
        view.addSubview(storyLabel)
        view.addSubview(answerLabel)
        view.addSubview(answerButton)
        setConstraints()
    }
    
    @objc func buttonTapped() {
        if answerLabel.isHidden {
            answerButton.isSelected = true
            storyLabel.isHidden = true
            answerLabel.isHidden = false
        } else {
            answerButton.isSelected = false
            answerLabel.isHidden = true
            storyLabel.isHidden = false
        }
    }
    
    func setConstraints() {
        
        // titleLabel constrains
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: view.frame.height / 9).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 30).isActive = true
        
        // storyLabel constrains
        
        NSLayoutConstraint(item: storyLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: titleLabel,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: view.frame.height / 35).isActive = true
        
        NSLayoutConstraint(item: storyLabel,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: answerButton,
                           attribute: .top,
                           multiplier: 1,
                           constant: -view.frame.height / 35).isActive = true
        
        NSLayoutConstraint(item: storyLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: view.frame.height / 25).isActive = true
        
        NSLayoutConstraint(item: storyLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -view.frame.height / 25).isActive = true
        
        // answerLabel constrains
        
        NSLayoutConstraint(item: answerLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: titleLabel,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: view.frame.height / 35).isActive = true
        
        NSLayoutConstraint(item: answerLabel,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: answerButton,
                           attribute: .top,
                           multiplier: 1,
                           constant: -view.frame.height / 35).isActive = true
        
        
        NSLayoutConstraint(item: answerLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: view.frame.height / 25).isActive = true
        
        NSLayoutConstraint(item: answerLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -view.frame.height / 25).isActive = true
        
        // answerButton constrains
        
        NSLayoutConstraint(item: answerButton,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -view.frame.height / 15).isActive = true
        
        NSLayoutConstraint(item: answerButton,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: answerButton,
                           attribute: .width,
                           relatedBy: .greaterThanOrEqual,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
        
        NSLayoutConstraint(item: answerButton,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 50).isActive = true
    }
}
