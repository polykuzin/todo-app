//
//  TabbarView.swift
//  
//
//  Created by polykuzin on 22/09/2022.
//

import SwiftUI
import CoreData
import CoreDesign

public struct TabbarView : View {
    
    @State
    private var action : Int? = 0
    
    @State
    private var selectedTab : TabbarType = .summary
    
    public init() { }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment.bottom) {
                TabView(selection: $selectedTab) {
//                    summary.tag(TabbarType.summary)
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
//        .ignoresSafeArea(.keyboard)
    }

//    private var summary : some View {
//
//    }
}
