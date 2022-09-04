//
//  TabbarItem.swift
//  todo-app
//
//  Created by polykuzin on 24/08/2022.
//

import SwiftUI

struct TabbarItem : View {
    
    let image : Image
    let width : CGFloat
    let selected : Bool
    let onSelect : (() -> Void)
    
    var body: some View {
        Button {
            onSelect()
        } label: {
            VStack(alignment: .center, spacing: 2.0) {
                ZStack(alignment: .bottomLeading) {
                    ZStack {
                        image
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .foregroundColor(selected ? Color.appColor : .textSecondary)
                        Text("")
                            .kerning(0.3)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .foregroundColor(Color.white)
                            .font(.caption)
                            .padding(.horizontal, 4)
                            .offset(x: 16.0, y: -8.0)
                    }
                }
                Text("")
                    .font(.caption)
            }
            .frame(width: width)
        }
        .buttonStyle(.plain)
    }
}

struct TabbarItem_Previews : PreviewProvider {
    
    static var previews : some View {
        TabbarItem(
            image: .plus,
            width: 50,
            selected: true,
            onSelect: { }
        )
    }
}
