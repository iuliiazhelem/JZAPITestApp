//
//  AnimalViewModel.swift
//  JZAPITestApp
//
//  Created on 10/11/22.
//

import Foundation


struct AnimalViewModel {
    
    var items = [Animal]()
    
    func item(by index: Int) -> Animal? {
        return items[index]
    }
    
    func count() -> Int {
        return items.count
    }
    
    mutating func resetData(_ newItems: [Animal]?) {
        guard let newItems = newItems else { return }
        items = newItems
    }
    
    mutating func insertData(_ newItems: [Animal]?) {
        guard let newItems = newItems else { return }
        
        items.insert(contentsOf:newItems, at:items.count)

    }
}
