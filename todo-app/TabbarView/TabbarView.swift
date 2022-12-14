//
//  TabbarView.swift
//  todo-app
//
//  Created by polykuzin on 29/09/2022.
//

import SwiftUI
import CoreAnalytics

struct TabbarView : View {
    
    @State var selected = 1
    
    @State var presented = false
    let icons = [
        Image.plus,
        Image.list
    ]
    
    @EnvironmentObject
    var analyticsManager : AnalyticsManager
    
    var view : some View = TasksView(
        viewModel: .init(
            taskRepository: CoreDataTaskRepository(
                context: PersistenceController.shared.container.viewContext
            )
        )
    )
    
    func TabbarButton(screen: GeometryProxy, number: Int) -> some View {
        Button {
            if number == 0 {
                presented.toggle()
            } else {
                self.selected = number
            }
        } label: {
            VStack {
                icons[number]
                    .font(.system(size: 25, weight: .regular, design: .default))
                    .foregroundColor(selected == number ? .blue : .gray)
            }
            .frame(width: screen.size.width / 2, height: 50)
        }
        .frame(width: screen.size.width / 2, height: 50)
    }
    
    func MenuTabbarButton(screen: GeometryProxy, number: Int) -> some View {
        Button {
            if number == 0 {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "tasks.addNewTask"), object: nil)
            } else {
                self.selected = number
            }
        } label: {
            VStack {
                icons[number]
                    .font(.system(size: 25, weight: .regular, design: .default))
                    .foregroundColor(
                        selected == number ? .blue : .gray
                    )
            }
            .frame(width: screen.size.width / 2, height: 50)
        }
//        .contextMenu {
//            Button(action: {
//                if let view = view as? TasksView {
//                    view.addNewTask()
//                }
//            }) {
//                Text("Create new list")
//                Image(systemName: "list.bullet")
//            }
//            Button(action: {
//                // TODO: just add new task
//            }) {
//                Text("Create new task")
//                Image(systemName: "plus")
//            }
//        }
    }
        
    var body: some View {
        GeometryReader { screen in
            VStack {
                ZStack {
                    switch selected {
                    case 0:
                        Text("????????????")
                    default:
                        NavigationView {
                            self.view.environmentObject(analyticsManager)
                        }
                    }
                }
                Divider()
                    .padding(.bottom, 16)
                HStack {
                    ForEach(0..<2, id: \.self) { number in
                        if number != 0 {
                            TabbarButton(screen: screen, number: number)
                        } else {
                            MenuTabbarButton(screen: screen, number: number)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
