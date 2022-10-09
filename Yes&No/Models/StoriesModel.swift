//
//  StoriesModel.swift
//  Yes&No
//
//  Created by Артур Фомин on 10.10.2022.
//

import Foundation
import UIKit

class StoriesModel {
    var image = UIImage()
    var title = ""
    var story = ""
    var answer = ""
    
    init(image: UIImage, title: String, story: String, answer: String) {
        self.image = image
        self.title = title
        self.story = story
        self.answer = answer
    }
}
