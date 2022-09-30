//
//  TasksView.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import SwiftUI

protocol _TasksView {
    
    func addNewTask()
}

struct TasksView : View, _TasksView {
    @ObservedObject var viewModel: TasksViewModel
    @State var shouldShowNewTaskButton = false
    
    let pub = NotificationCenter.default
            .publisher(for: NSNotification.Name("tasks.addNewTask"))
    
    func addNewTask() {
        shouldShowNewTaskButton.toggle()
    }

    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(viewModel.taskCellViewModels) { taskCellViewModel in
                    TaskCell(viewModel: taskCellViewModel)
                }
                .onDelete { indexSet in
                    viewModel.onTaskDeleted(atOffsets: indexSet)
                }
                if shouldShowNewTaskButton {
                    TaskCell(viewModel: .init(task: .init(), taskRepository: Factory.create())) { result in
                        if case .success(let task) = result {
                            viewModel.onTaskAdded(task: task)
                        }
                        shouldShowNewTaskButton.toggle()
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onReceive(pub) { output in
            self.addNewTask()
        }
    }
}
