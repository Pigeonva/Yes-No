//
//  Bindable.swift
//  Yes&No
//
//  Created by Артур Фомин on 09.10.2022.
//

import Foundation

class Bindable<T> {
    
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
