//
//  ViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import UIKit

class ViewModel: ViewModelType {

    var categories = [Category(image: UIImage(named: K.backgroundImage), title: "Простые истории", dedcription: "World"),
                      Category(image: UIImage(named: K.backgroundImage), title: "Непростые истории", dedcription: "World"),
                      Category(image: UIImage(named: K.backgroundImage), title: "Сложные истории", dedcription: "World")]
    
    func numberOfItems() -> Int {
        return categories.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CollectionViewCellViewModelType? {
        let category = categories[indexPath.row]
        
        return CollectionViewCellViewModel(category: category)
    }
}
