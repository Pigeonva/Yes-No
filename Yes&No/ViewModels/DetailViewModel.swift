//
//  DetailViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 05.09.2022.
//

import Foundation
import UIKit

class DetailViewModel {

    var story = Bindable<StoriesModel?>(StoriesModel(image: UIImage(), title: "", story: "", answer: ""))
    
    var categoryIndex: Int?
    
    var storyIndex: Int?
    
    func setup() {
        DataManager.shared.fetchData {[weak self] model in
            guard let categoryIndex = self?.categoryIndex, let storyIndex = self?.storyIndex else { return }
            let title = model.category[categoryIndex].stories[storyIndex].title
            let story = model.category[categoryIndex].stories[storyIndex].story
            let answer = model.category[categoryIndex].stories[storyIndex].answer
            let newModel = StoriesModel(image: UIImage(), title: title, story: story, answer: answer)
            
            self?.story.value = newModel
        }
    }
}
