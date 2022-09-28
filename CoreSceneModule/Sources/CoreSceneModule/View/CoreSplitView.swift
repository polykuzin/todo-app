//
//  SwiftUIView.swift
//  
//
//  Created by polykuzin on 22/09/2022.
//

import SwiftUI
import Module_Tabbar

struct CoreSplitView : View {
    
    init() { }
    
    private var tabbarCoordinator = TabbarCoordinator()
    
    var body : some View {
        Text("")
//        tabbarCoordinator.startNavigationFlow()
//            .frame(width: .infinity, height: .infinity, alignment: .bottom)
    }
}

struct CoreSplitViewPreviews : PreviewProvider {
    
    static var previews : some View {
        CoreSplitView()
            .previewDevice(.init(stringLiteral: "iPhone 14"))
    }
}
