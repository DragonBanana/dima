//
//  Model.swift
//  CounterDIY
//
//  Created by Luca Terracciano on 22/12/22.
//

import Foundation

class Model: ObservableObject {
    
    @Published var value: Float = 0
    
    func addOne() -> Void {
        value+=1
    }
    
    func subOne() -> Void {
        value-=1
    }
}
