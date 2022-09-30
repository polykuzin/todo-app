//
//  Ext+Collection.swift
//  todo-app
//
//  Created by polykuzin on 31/08/2022.
//

public extension Collection {
    
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
