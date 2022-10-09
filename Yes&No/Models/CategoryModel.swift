//
//  CategoryModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 09.10.2022.
//

import Foundation
import UIKit

class CategoryModel {
    var image: UIImage = UIImage()
    var title: String = ""
    var description: String = ""
    
    init(image: UIImage, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}
