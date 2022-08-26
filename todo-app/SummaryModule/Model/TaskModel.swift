//
//  TaskModel.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct TaskModel : Identifiable, Codable {
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
