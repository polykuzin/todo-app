//
//  TabbarView.swift
//  
//
//  Created by polykuzin on 22/09/2022.
//

import SwiftUI
import CoreData
import CoreDesign
import Module_Inbox

public struct TabbarView : View {
    
    @State
    private var action : Int? = 0
    
    private var tabbarItems = [
        TabbarType.add,
        TabbarType.inbox,
        TabbarType.inbox,
        TabbarType.inbox
    ]
    
    @State
    private var selectedTab : TabbarType = .inbox
    
    public init() { }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment.bottom) {
                TabView(selection: $selectedTab) {
                    inboxView.tag(TabbarType.inbox)
                    inboxView.tag(TabbarType.inbox)
                }
            }
            VStack(spacing: 16) {
                Rectangle()
                    .foregroundColor(.textSecondary)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                HStack(spacing: 0) {
                    TabbarItem(
                        image: Image(systemName: "plus"),
                        width: geometry.size.width / CGFloat(tabbarItems.count),
                        selected: selectedTab ==  .add,
                        onSelect: {
                            selectedTab = .add
                        }
                    )
                    TabbarItem(
                        image: Image(systemName: "list.bullet"),
                        width: geometry.size.width / CGFloat(tabbarItems.count),
                        selected: selectedTab == .inbox,
                        onSelect: {
                            selectedTab = .inbox
                        }
                    )
                    TabbarItem(
                        image: Image(systemName: "list.bullet"),
                        width: geometry.size.width / CGFloat(tabbarItems.count),
                        selected: selectedTab == .inbox,
                        onSelect: {
                            selectedTab = .inbox
                        }
                    )
                    TabbarItem(
                        image: Image(systemName: "list.bullet"),
                        width: geometry.size.width / CGFloat(tabbarItems.count),
                        selected: selectedTab == .inbox,
                        onSelect: {
                            selectedTab = .inbox
                        }
                    )
                }
            }
        }
    }
    
    var inboxView : some View {
        return SwiftUIView()
    }
}

struct TabbarView_Previews : PreviewProvider {
    
    static var previews : some View {
        TabbarView()
    }
}
