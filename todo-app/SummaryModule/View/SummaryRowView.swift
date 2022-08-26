//
//  SummaryRowView.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct SummaryRowView : View {
    
    let item: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = TaskModel(title: "First item!", isCompleted: false)
    static var item2 = TaskModel(title: "Second Item.", isCompleted: true)
    
    static var previews: some View {
        Group {
            SummaryRowView(item: item1)
            SummaryRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        .previewDevice("iPhone 13 Pro Max")
    }
}
