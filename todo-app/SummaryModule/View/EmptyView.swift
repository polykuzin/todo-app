//
//  EmptyView.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct EmptyView : View {
    
    var body: some View {
        VStack{
            Spacer()
            
            VStack(alignment: .center) {
                Text("Nothing here")
                    .font(.title)
                    .foregroundColor(.appColor)
                Text("you can add new task")
                    .font(.title2)
                    .foregroundColor(.textSecondary)
                GeometryReader { geometry in
                    HStack(alignment: .top) {
                        Image(systemName: "arrow.down")
                            .foregroundColor(.appColor)
                            .frame(width: geometry.size.width / 2, height: 28)
                        Image("")
                            .foregroundColor(.appColor)
                            .frame(width: geometry.size.width / 2, height: 28)
                    }
                }
                .padding(.bottom, 72)
            }
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 100)
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
