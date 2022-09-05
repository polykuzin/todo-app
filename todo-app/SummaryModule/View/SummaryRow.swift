//
//  SummaryRow.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct SummaryRow : View {
    
    public let item : TaskModel!
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                .foregroundColor(.appColor)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}
