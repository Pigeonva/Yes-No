//
//  Story.swift
//  Yes&No
//
//  Created by Артур Фомин on 02.09.2022.
//

import UIKit

class Model: Codable {
    let category: StoryType
}

class StoryType: Codable {
    let easy: StoryInfo
    let medium: StoryInfo
    let hard: StoryInfo
}

class StoryInfo: Codable {
    let title: String
    let description: String
    let stories: [Story]
}

class Story: Codable {
    let title: String
    let story: String
    let answer: String
}
