//
//  CollectionViewModelType.swift
//  Yes&No
//
//  Created by Артур Фомин on 31.08.2022.
//

import UIKit

protocol CollectionViewCellViewModelType: AnyObject {
    
    var image: UIImage {get}
    var title: String {get}
    var description: String {get}
    
}
