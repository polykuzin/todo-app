//
//  TabbarView.swift
//  todo-app
//
//  Created by polykuzin on 24/08/2022.
//
// swiftlint:disable all
import SwiftUI

struct TabbarView : View {
    
    @State
    private var action: Int? = 0
    
    @State
    private var selectedTab : TabbarType = .summary
    
    @StateObject
    var viewModel = SummaryViewModel()
    
    @EnvironmentObject
    var listViewModel : SummaryViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment.bottom) {
                NavigationLink(
                    destination: AddView()
                        .environmentObject(SummaryViewModel())
                        .onAppear(perform: UIApplication.shared.addTapGestureRecognizer),
                    tag: 1,
                    selection: $action) {
                    EmptyView()
                }
                TabView(selection: $selectedTab) {
                    // add.tag(TabbarType.summary)
                    summary.tag(TabbarType.summary)
                    // settings.tag(TabbarType.settings)
                }
                VStack(spacing: 16) {
                    Rectangle()
                        .foregroundColor(.textSecondary)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                    HStack(spacing: 0) {
                        TabbarItem(
                            image: Image(systemName: "plus"),
                            selected: selectedTab ==  .add,
                            itemWidth: geometry.size.width / 2,
                            onTap: {
                                self.action = 1
                                selectedTab = .summary
                            }
                        )
                        TabbarItem(
                            image: Image(systemName: "list.bullet"),
                            selected: selectedTab == .summary,
                            itemWidth: geometry.size.width / 2,
                            onTap: {
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
            .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}

struct TabbarView_Previews : PreviewProvider {
    
    static var previews : some View {
        TabbarView()
            .previewDevice("iPhone 8")
    }
}
