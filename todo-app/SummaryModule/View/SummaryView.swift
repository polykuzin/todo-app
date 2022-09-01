//
//  SummaryView.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct SummaryView : View {
    
    @ObservedObject
    var viewModel : SummaryViewModel = SummaryViewModel()
    
    @Environment(\.managedObjectContext)
    var context
    
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.items, id: \.self) { item in
                        SummaryRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.updateItem(item: item)
                                }
                            }
                            .contextMenu {
                                Group {
                                    Button("delete") {
                                        viewModel.deleteItem(item)
                                    }
                                }
                            }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear{
            viewModel.items = viewModel.getItems()
        }
    }
}
