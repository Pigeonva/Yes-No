//
//  TableViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 02.09.2022.
//

import UIKit

class TableViewModel: TableViewModelType {
    
    var stories: Array<Story>
    
    private var selectedIndexPath: IndexPath?
    
    init(stories: Array<Story>) {
        self.stories = stories
    }
    
    func numberOfRows() -> Int {
        return stories.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType? {
        let story = stories[indexPath.row]
        
        return TableViewCellViewModel(story: story)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else {return nil}

        return DetailViewModel(story: stories[selectedIndexPath.row])
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
}
