//
//  ContentView.swift
//  todo-app
//
//  Created by polykuzin on 29/08/2022.
//

import SwiftUI

struct ContentView : View {
    
    var body : some View {
        NavigationView {
            TabbarView()
        }
        .navigationViewStyle(.stack)
    }
}
