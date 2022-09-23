//
//  TabbarItem.swift
//  
//
//  Created by polykuzin on 22/09/2022.
//

import SwiftUI
import CoreDesign

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
                            .foregroundColor(selected ? Color.appPrimary : .textSecondary)
                        Text("")
                            .kerning(0.3)
                            .lineLimit(1)
                            .font(.caption)
                            .truncationMode(.tail)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 4)
                            .offset(x: 16.0, y: -8.0)
                    }
                }
                Text("")
                    .font(.caption)
            }
            .frame(width: width)
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.plain)
    }
}
