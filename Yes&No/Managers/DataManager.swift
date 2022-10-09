//
//  DataManager.swift
//  Yes&No
//
//  Created by Артур Фомин on 09.10.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init(){}
    
    func fetchData(completion: @escaping (Model)->Void) {
        guard let path = Bundle.main.path(forResource: "YesNo", ofType: "json") else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let object = try JSONDecoder().decode(Model.self, from: data)
            
            completion(object)
            
        } catch let error {
            print(error)
        }
    }
}
