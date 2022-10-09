//
//  CollectionViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import UIKit

class CollectionViewCellViewModel {
    
    var category: Category
    
    var image: UIImage {
        return category.image ?? UIImage()
    }
    
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
