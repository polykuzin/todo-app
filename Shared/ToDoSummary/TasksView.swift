//
//  TasksView.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import UIKit
import SwiftUI
import CoreAnalytics

protocol _TasksView {
    
    func addNewTask()
}

struct TasksView : View, _TasksView {
    
    public func addNewTask() {
        shouldShowNewTaskButton.toggle()
    }
    
    public init(viewModel: TasksViewModel, shouldShowNewTaskButton: Bool = false) {
        self.viewModel = viewModel
        self.shouldShowNewTaskButton = shouldShowNewTaskButton
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.systemFont(ofSize: 17, weight: .semibold)]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 17, weight: .semibold)]
    }
    
    @ObservedObject
    private var viewModel : TasksViewModel
    
    public var tasksAnalytics = TasksAnalytics()
    
    @EnvironmentObject
    private var analyticsManager : AnalyticsManager
    
    @State
    private var shouldShowNewTaskButton = false
    
    private var publisher = NotificationCenter.default
        .publisher(for: NSNotification.Name("tasks.addNewTask"))
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(viewModel.taskCellViewModels) { taskCellViewModel in
                    TaskCell(viewModel: taskCellViewModel)
                }
                .onDelete { indexSet in
                    viewModel.onTaskDeleted(atOffsets: indexSet)
                    analyticsManager.report(tasksAnalytics.reportTaskDelete())
                }
                if shouldShowNewTaskButton || viewModel.taskCellViewModels.isEmpty {
                    TaskCell(
                        viewModel: .init(
                            task: .init(),
                            taskRepository: CoreDataTaskRepository(
                                context: PersistenceController.shared.container.viewContext
                            )
                        )
                    ) { result in
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
        .onReceive(publisher) { output in
            self.addNewTask()
        }
    }
}
