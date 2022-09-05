//
//  DetailViewController.swift
//  Yes&No
//
//  Created by Артур Фомин on 05.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelType?
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.detailBackground)
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        
        return imageView
    }()
    
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
        label.text = "Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story Story label.numberOfLines = 0 label.numberOfLines = 0 label.numberOfLines = 0 label.numberOfLines = 0 label.numberOfLines = 0 label.numberOfLines = 0"
        label.backgroundColor = .red
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.text = "Answer"
        label.isHidden = true
        label.backgroundColor = .green
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let answerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(storyLabel)
        view.addSubview(answerLabel)
        view.addSubview(answerButton)
        setConstraints()
    }
    
    @objc func buttonTapped() {
        if answerLabel.isHidden {
            storyLabel.isHidden = true
            answerLabel.isHidden = false
        } else {
            answerLabel.isHidden = true
            storyLabel.isHidden = false
        }
    }

    func setConstraints() {
        
        // backgroundImageView constrains
        
        NSLayoutConstraint(item: backgroundImageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: backgroundImageView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: backgroundImageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: backgroundImageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
        
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
                           constant: view.frame.height / 20).isActive = true
        
        NSLayoutConstraint(item: storyLabel,
                           attribute: .bottom,
                           relatedBy: .lessThanOrEqual,
                           toItem: answerButton,
                           attribute: .top,
                           multiplier: 1,
                           constant: -view.frame.height / 15).isActive = true
        
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
                           constant: view.frame.height / 20).isActive = true
        
        NSLayoutConstraint(item: answerLabel,
                           attribute: .bottom,
                           relatedBy: .lessThanOrEqual,
                           toItem: answerButton,
                           attribute: .top,
                           multiplier: 1,
                           constant: -view.frame.height / 15).isActive = true
        
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
                           constant: -view.frame.height / 8).isActive = true
        
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
    }
}
