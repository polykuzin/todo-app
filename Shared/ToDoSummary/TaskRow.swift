//
//  TaskRow.swift
//  todo-app
//
//  Created by polykuzin on 01/10/2022.
//

import SwiftUI

enum InputError: Error {
  case empty
}

struct TaskCell: View {
    
    @ObservedObject var viewModel: TaskCellViewModel
    var onCommit: (Result<Task, InputError>) -> Void = { _ in }

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(viewModel.taskStateIconName)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    viewModel.onTaskStateIconTapped()
                }
                .foregroundColor(.appColor)
            TextField(
                "Enter task title",
                text: $viewModel.task.title,
                onCommit: {
                    if !viewModel.task.title.isEmpty {
                        onCommit(.success(viewModel.task))
                    }
                    else {
                        onCommit(.failure(.empty))
                    }
                }
            )
            .id(viewModel.task.id)
            .autocapitalization(.sentences)
        }
    }
}
