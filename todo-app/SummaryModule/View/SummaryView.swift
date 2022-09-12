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
        NavigationView {
            ZStack {
                if viewModel.items.isEmpty {
                    EmptyView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
//                        VStack {
                            ForEach(viewModel.items, id: \.self) { item in
                                SummaryRow(item: item)
//                                    .padding(.horizontal, 16)
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
//                        }
                    }
                    .listStyle(.plain)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                }
            }
            .navigationBarItems(
                leading: Text("Inbox")
                    .font(.title)
                    .foregroundColor(.textPrimary)
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Menu {
                    Button {
                        viewModel.deleteAllItems()
                    } label: {
                        Text("delete all")
                            .foregroundColor(.red)
                    }
                } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.textPrimary)
                    }
//                    Button(action: {
//                    Group {
//                        Button {
//                            viewModel.deleteAllItems()
//                        } label: {
//                            Text("delete all")
//                                .font(.caption)
//                                .foregroundColor(.red)
//                        }
//
//                    }
//                }, label: {
//                    Image(systemName: "ellipsis")
//                        .foregroundColor(.textPrimary)
//                })
            )
        }
        .onAppear{
            viewModel.items = viewModel.getItems()
        }
    }
}
