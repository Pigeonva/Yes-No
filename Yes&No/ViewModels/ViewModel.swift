//
//  ViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import UIKit

class ViewModel {
    
    var categoryImages = [UIImage(named: K.easyImage), UIImage(named: K.mediumImage), UIImage(named: K.hardImage)]
    
    var storyImage = [UIImage()]
    
    var categoryModel = Bindable<[CategoryModel]>([])
    
    func setup(indexPath: IndexPath) {
        DataManager.shared.fetchData { model in
            guard let image = self.categoryImages[indexPath.row] else { return }
            let title = model.category[indexPath.row].title
            let description = model.category[indexPath.row].description
            let newModel = CategoryModel(image: image, title: title, description: description)
            
            self.categoryModel.value.append(newModel)
        }
    }

    
}
