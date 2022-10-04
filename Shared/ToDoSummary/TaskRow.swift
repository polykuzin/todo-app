//
//  TaskRow.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import SwiftUI
import CoreAnalytics

enum InputError: Error {
    case empty
}

struct TaskCell: View {
    
    public init(viewModel: TaskCellViewModel, _ onCommit: @escaping (Result<Task, InputError>) -> Void = { _ in }) {
        self.onCommit = onCommit
        self.viewModel = viewModel
    }
    
    @ObservedObject
    private var viewModel : TaskCellViewModel
    
    private var tasksAnalytics = TasksAnalytics()
    
    @EnvironmentObject
    private var analyticsManager : AnalyticsManager
    
    private var onCommit : (Result<Task, InputError>) -> Void = { _ in }
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(viewModel.taskStateIconName)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    if viewModel.taskStateIconName == "" {
                        analyticsManager.report(tasksAnalytics.reportTaskComplete())
                    } else {
                        analyticsManager.report(tasksAnalytics.reportTaskReComplete())
                    }
                    viewModel.onTaskStateIconTapped()
                }
                .foregroundColor(.appColor)
            TextField(
                "Enter task title",
                text: $viewModel.task.title,
                onCommit: {
                    if !viewModel.task.title.isEmpty {
                        onCommit(.success(viewModel.task))
                        analyticsManager.report(tasksAnalytics.reportTaskAdd())
                    } else {
                        onCommit(.failure(.empty))
                    }
                }
            )
            .id(viewModel.task.id)
            .autocapitalization(.sentences)
        }
    }
}
