//
//  Task.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String = ""
    var hasDone: Bool = false
}
