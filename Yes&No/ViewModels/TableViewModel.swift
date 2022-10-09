//
//  TableViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 02.09.2022.
//

import UIKit

class TableViewModel {
    
    var stories = Bindable<[StoriesModel]>([])
    var currentIndex: Int?
    
    let storyImages = [
        [UIImage(named: K.easyOne),
         UIImage(named: K.easyTwo),
         UIImage(named: K.easyThree),
         UIImage(named: K.easyFour),
         UIImage(named: K.easyFive)],
        [UIImage(named: K.mediumOne),
         UIImage(named: K.mediumTwo),
         UIImage(named: K.mediumThree),
         UIImage(named: K.mediumFour),
         UIImage(named: K.mediumFive),],
        [UIImage(named: K.hardOne),
         UIImage(named: K.hardTwo),
         UIImage(named: K.hardThree),
         UIImage(named: K.hardFour),
         UIImage(named: K.hardFive)]
    ]
    
    func setup(indexPath: IndexPath) {
        DataManager.shared.fetchData {[weak self] model in
            guard let index = self?.currentIndex else { return }
            guard let image = self?.storyImages[index][indexPath.row] else { return }
            let title = model.category[index].stories[indexPath.row].title
            let newModel = StoriesModel(image: image, title: title, story: "", answer: "")
            
            self?.stories.value.append(newModel)
            
        }
    }
    
}
