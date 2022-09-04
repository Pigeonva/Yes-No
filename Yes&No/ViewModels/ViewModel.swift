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
    
    var stories = [[Story(image: UIImage(named: K.easyOne)!, title: "easy", story: "easy", answer: "easy"),
                    Story(image: UIImage(named: K.easyTwo)!, title: "easy", story: "easy", answer: "easy"),
                    Story(image: UIImage(named: K.easyThree)!, title: "easy", story: "easy", answer: "easy"),
                    Story(image: UIImage(named: K.easyFour)!, title: "easy", story: "easy", answer: "easy"),
                    Story(image: UIImage(named: K.easyFive)!, title: "easy", story: "easy", answer: "easy")],
                   [Story(image: UIImage(named: K.mediumOne)!, title: "medium", story: "medium", answer: "medium"),
                    Story(image: UIImage(named: K.mediumTwo)!, title: "medium", story: "medium", answer: "medium"),
                    Story(image: UIImage(named: K.mediumThree)!, title: "medium", story: "medium", answer: "medium"),
                    Story(image: UIImage(named: K.mediumFour)!, title: "medium", story: "medium", answer: "medium"),
                    Story(image: UIImage(named: K.mediumFive)!, title: "medium", story: "medium", answer: "medium")],
                   [Story(image: UIImage(named: K.hardOne)!, title: "hard", story: "hard", answer: "hard"),
                    Story(image: UIImage(named: K.hardTwo)!, title: "hard", story: "hard", answer: "hard"),
                    Story(image: UIImage(named: K.hardThree)!, title: "hard", story: "hard", answer: "hard"),
                    Story(image: UIImage(named: K.hardFour)!, title: "hard", story: "hard", answer: "hard"),
                    Story(image: UIImage(named: K.hardFive)!, title: "hard", story: "hard", answer: "hard")]]
    
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
