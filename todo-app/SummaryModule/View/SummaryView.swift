//
//  SummaryView.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct SummaryView : View {
    
    @EnvironmentObject
    var listViewModel: SummaryViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        SummaryRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SummaryView()
        }
        .environmentObject(SummaryViewModel())
        .previewDevice("iPhone 13 Pro Max")
    }
}
