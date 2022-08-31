//
//  ViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import Foundation

class ViewModel: ViewModelType {

    var categories = [Category]()
    
    func numberOfItems() -> Int {
        return categories.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CollectionViewCellViewModelType? {
        let category = categories[indexPath.row]
        
        return CollectionViewCellViewModel(category: category)
    }
}
