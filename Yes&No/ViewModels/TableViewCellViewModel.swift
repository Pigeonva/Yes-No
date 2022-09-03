//
//  TableViewCellViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 03.09.2022.
//

import UIKit

class TableViewCellViewModel: TableViewCellViewModelType {
    
    var story: Story
    
    init(story: Story) {
        self.story = story
    }
    
}
