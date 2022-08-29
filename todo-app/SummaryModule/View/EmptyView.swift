//
//  EmptyView.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct EmptyView : View {
    
    var body: some View {
        Path { path in
//            path.addLine(to: <#T##CGPoint#>)
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyView()
        }
        .previewDevice("iPhone 13 Pro Max")
    }
}
