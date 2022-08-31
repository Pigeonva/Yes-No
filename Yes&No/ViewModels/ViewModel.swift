//
//  ViewModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import Foundation

class ViewModel: ViewModelType {
    
    var categories = [MainModel]()
    
    func numberOfItems() -> Int {
        return categories.count
    }
}
