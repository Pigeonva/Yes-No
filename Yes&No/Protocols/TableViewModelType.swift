//
//  TableViewModelType.swift
//  Yes&No
//
//  Created by Артур Фомин on 02.09.2022.
//

import UIKit

protocol TableViewModelType {
    
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType?
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(at indexPath: IndexPath)
}
