//
//  TabbarView.swift
//  todo-app
//
//  Created by polykuzin on 24/08/2022.
//

import SwiftUI
import CoreData

struct TabbarView : View {
    
    @State
    private var action : Int? = 0
    
    @State
    private var selectedTab : TabbarType = .summary
    
    @StateObject
    var viewModel = SummaryViewModel()
    
    @EnvironmentObject
    var listViewModel : SummaryViewModel
    
    private var context : NSManagedObjectContext = {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate
        else { fatalError() }
        return delegate.persistentContainer.viewContext
    }()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment.bottom) {
                NavigationLink(
                    destination: AddView()
                        .environmentObject(SummaryViewModel())
                        .onAppear(perform: UIApplication.shared.addTapGestureRecognizer),
                    tag: 1,
                    selection: $action
                ) {
                    EmptyView()
                }
                TabView(selection: $selectedTab) {
                    summary.tag(TabbarType.summary)
                }
                VStack(spacing: 16) {
                    Rectangle()
                        .foregroundColor(.textSecondary)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                    HStack(spacing: 0) {
                        TabbarItem(
                            image: Image(systemName: "plus"),
                            width: geometry.size.width / 2,
                            selected: selectedTab ==  .add,
                            onSelect: {
                                self.action = 1
                                selectedTab = .summary
                            }
                        )
                        TabbarItem(
                            image: Image(systemName: "list.bullet"),
                            width: geometry.size.width / 2,
                            selected: selectedTab == .summary,
                            onSelect: {
                                selectedTab = .summary
                            }
                        )
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
    
    private var summary : some View {
        SummaryView()
            .environment(\.managedObjectContext, context)
    }
}
