//
//  ViewController.swift
//  Yes&No
//
//  Created by Артур Фомин on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModelType?
    
    var mainCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        view.backgroundColor = .systemCyan
        createMainCollectionView()
        setConstraints()
    }
    
    func createMainCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (view.frame.size.width/3),
                                 height: (view.frame.size.width/2))
        mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        mainCollectionView?.delegate = self
        mainCollectionView?.dataSource = self
        
        mainCollectionView?.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: K.mainCollectionCell)
        
        view.addSubview(mainCollectionView!)
    }
    
    //MARK: - Set constraints for UI elements
    
    func setConstraints() {
        
        // mainCollectionView constraints
        mainCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: view.frame.height / 5).isActive = true
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -view.frame.height / 5).isActive = true
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: view.frame.height / 15).isActive = true
        
        NSLayoutConstraint(item: mainCollectionView!,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -view.frame.height / 15).isActive = true
        
        
    }


}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.mainCollectionCell, for: indexPath) as? MainCollectionViewCell
        guard let collectionViewCell = cell, let viewModel = viewModel else {return UICollectionViewCell()}
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        collectionViewCell.viewModel = cellViewModel
        
        return collectionViewCell
    }
    
    
}
