//
//  ViewController.swift
//  Yes&No
//
//  Created by Артур Фомин on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - let/var
    
    var viewModel = ViewModel()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.backgroundImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var mainCollectionView: UICollectionView?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.text = "Категории"
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    //MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .black
        viewModel = ViewModel()
        view.addSubview(backgroundImageView)
        createMainCollectionView()
        view.addSubview(titleLabel)
        setConstraints()
    }
    
    //MARK: - Methods
    
    func createMainCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (view.frame.size.width/3),
                                 height: (view.frame.size.width)/2)
        mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionView?.isPagingEnabled = true
        mainCollectionView?.backgroundColor = .systemPurple
        guard let mainCollectionView = mainCollectionView else {return}
        mainCollectionView.layer.cornerRadius = 10
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: K.mainCollectionCell)
        view.addSubview(mainCollectionView)
    }
    
    //MARK: - Set constraints for UI elements
    
    func setConstraints() {
        
        // backgroundImageView constraints
        
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
        
        // mainCollectionView constraints
        
        mainCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: view.frame.height / 6).isActive = true
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -view.frame.height / 6).isActive = true
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: view.frame.width / 10).isActive = true
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -view.frame.width / 10).isActive = true
        
        // title label constraints
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: mainCollectionView,
                           attribute: .top,
                           multiplier: 1,
                           constant: -view.frame.height / 15).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
    }


}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.mainCollectionCell, for: indexPath) as? MainCollectionViewCell
        guard let collectionViewCell = cell else {return UICollectionViewCell()}
        
        viewModel.setup(indexPath: indexPath)
        
        viewModel.categoryModel.bind { models in
                    DispatchQueue.main.async {
                        collectionViewCell.imageView.image = models[indexPath.row].image
                        collectionViewCell.titleLabel.text = models[indexPath.row].title
                        collectionViewCell.descriptionLabel.text = models[indexPath.row].description
                    }
                }
        
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let tableVC = TableViewController()
        tableVC.viewModel.currentIndex = indexPath.row

        navigationController?.pushViewController(tableVC, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (mainCollectionView?.frame.width)!, height: (mainCollectionView?.frame.height)!)
    }
}
