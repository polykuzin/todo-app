//
//  TabbarView.swift
//  todo-app
//
//  Created by polykuzin on 24/08/2022.
//

import SwiftUI

struct TabbarView : View {
    
    @State
    private var selectedTab : TabbarType = .summary
    
    @EnvironmentObject
    var listViewModel : SummaryViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment.bottom) {
                TabView(selection: $selectedTab) {
                    add.tag(TabbarType.add)
                    summary.tag(TabbarType.summary)
//                    settings.tag(TabbarType.settings)
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
                                selectedTab = .add
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
//                        TabbarItem(
//                            image: Image(systemName: "gearshape"),
//                            selected: selectedTab == .settings,
//                            itemWidth: geometry.size.width / 2,
//                            onTap: {
//                                selectedTab = .settings
//                            }
//                        )
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
    
    private var add : some View {
        AddView()
            .environmentObject(SummaryViewModel())
            .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
    }
    
    private var summary : some View {
        SummaryView()
            .environmentObject(SummaryViewModel())
    }
}

struct TabbarView_Previews : PreviewProvider {
    
    static var previews : some View {
        TabbarView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
