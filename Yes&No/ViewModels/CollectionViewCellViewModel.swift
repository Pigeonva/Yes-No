//
//  CollectionViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import Foundation

class CollectionViewCellViewModel: CollectionViewCellViewModelType {
    
    var category: Category
    
    var title: String {
        return category.title
    }
    
    var description: String {
        return category.dedcription
    }
    
    init(category: Category) {
        self.category = category
    }
}
