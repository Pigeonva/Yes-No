//
//  ViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import UIKit

class ViewModel {
    
    private var selectedIndexPath: IndexPath?
    
    var categoryImages = [UIImage()]
    
    var storyImage = [UIImage()]

    
    func numberOfItems() -> Int {
        return categories.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CollectionViewCellViewModelType? {
        let category = categories[indexPath.row]
        
        return CollectionViewCellViewModel(category: category)
    }
    
    func viewModelForSelectedRow() -> TableViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else {return nil}
        
        return TableViewModel(stories: stories[selectedIndexPath.row])
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
