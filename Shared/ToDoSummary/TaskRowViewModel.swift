//
//  TaskRowViewModel.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import Combine
import SwiftUI

class TaskCellViewModel: ObservableObject, Identifiable {
    
    public var id : String {
        task.id
    }
    
    @Published
    public var task: Task
    
    @Published
    public var taskStateIconName = ""
    
    private let taskRepository: TaskRepository

    private var cancellables = Set<AnyCancellable>()

    init(task: Task, taskRepository: TaskRepository) {
        self.task = task
        self.taskRepository = taskRepository
        $task
            .map { $0.hasDone ? "checkbox_tick" : "checkbox" }
            .assign(to: \.taskStateIconName, on: self)
            .store(in: &cancellables)
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .flatMap { [unowned self] task in
                self.taskRepository.update(task: task)
                    .replaceError(with: task)
            }
            .assign(to: \.task, on: self)
            .store(in: &cancellables)
    }

    func onTaskStateIconTapped() {
        task.hasDone.toggle()
    }
}
