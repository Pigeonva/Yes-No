//
//  TableViewCellViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 03.09.2022.
//

import UIKit

class TableViewCellViewModel {
    
    var oneStory: Story
    
    var image: UIImage {
        return oneStory.image
    }
    
    var title: String {
        return oneStory.title
    }
    
    init(story: Story) {
        self.oneStory = story
    }
    
}
