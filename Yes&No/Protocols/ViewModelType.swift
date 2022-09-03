//
//  ViewModelType.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import Foundation

protocol ViewModelType {
    
    func numberOfItems() -> Int
    func cellViewModel(for indexPath: IndexPath) -> CollectionViewCellViewModelType?
    func viewModelForSelectedRow() -> TableViewModelType?
    func selectRow(at indexPath: IndexPath)
}
