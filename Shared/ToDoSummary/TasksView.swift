//
//  TasksView.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import UIKit
import SwiftUI

protocol _TasksView {
    
    func addNewTask()
}

struct TasksView : View, _TasksView {
    @ObservedObject var viewModel: TasksViewModel
    @State var shouldShowNewTaskButton = false
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("tasks.addNewTask"))
    
    init(viewModel: TasksViewModel, shouldShowNewTaskButton: Bool = false) {
        self.viewModel = viewModel
        self.shouldShowNewTaskButton = shouldShowNewTaskButton
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.systemFont(ofSize: 17, weight: .semibold)]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 17, weight: .semibold)]
    }
    
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
                if shouldShowNewTaskButton || viewModel.taskCellViewModels.isEmpty {
                    TaskCell(viewModel: .init(task: .init(), taskRepository: Factory.create())) { result in
                        if case .success(let task) = result {
                            viewModel.onTaskAdded(task: task)
                        }
                        shouldShowNewTaskButton.toggle()
                    }
                }
            }
        }
        .navigationBarItems(
            leading: Text("All tasks")
                .font(.system(size: 17, weight: .semibold, design: .default))
        )
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.onAppear()
        }
        .listStyle(.inset)
        .onReceive(pub) { output in
            self.addNewTask()
        }
    }
}
