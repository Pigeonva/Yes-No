//
//  ViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import UIKit

class ViewModel: ViewModelType {
    
    private var selectedIndexPath: IndexPath?

    var categories = [Category(image: UIImage(named: K.easyImage),
                               title: "Для новичков",
                               dedcription: "  Простые, но в то же время очень интересные истории для тех, кто толко начинает знакомиться с этой игрой. В добрый путь."),
                      Category(image: UIImage(named: K.mediumImage),
                               title: "Непростые истории",
                               dedcription: "  Вам предстоит разгадать ситуации покрытые жуткими тайнами. Продолжайте в том же духе."),
                      Category(image: UIImage(named: K.hardImage),
                               title: "Первоклассный детектив",
                               dedcription: "  Самые сложные и запутанные истории в которых вам придется изрядно поломать голову. Могу только пожелать вам удачи!")]
    
    var stories = [[Story(image: UIImage(), title: "easy", story: "easy", answer: "easy")],
                   [Story(image: UIImage(), title: "medium", story: "medium", answer: "medium")],
                   [Story(image: UIImage(), title: "hard", story: "hard", answer: "hard")]]
    
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
