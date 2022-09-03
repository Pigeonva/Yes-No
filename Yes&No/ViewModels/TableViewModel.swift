//
//  TableViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 02.09.2022.
//

import UIKit

class TableViewModel: TableViewModelType {
    
    var stories: Array<Story>
    
    init(stories: Array<Story>) {
        self.stories = stories
    }
    
    func numberOfRows() -> Int {
        return stories.count
    }
}
