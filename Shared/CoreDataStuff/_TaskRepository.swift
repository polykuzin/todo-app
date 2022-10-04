//
//  _TaskRepository.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import Combine
import Foundation

protocol TaskRepository {
    func save(task: Task) -> AnyPublisher<Bool, NSError>
    func fetch() -> AnyPublisher<[Task], NSError>
    func update(task: Task) -> AnyPublisher<Task, NSError>
    func delete(taskID: String) -> AnyPublisher<Void, NSError>
}
