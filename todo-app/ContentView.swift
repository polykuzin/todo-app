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

struct ContentView_Previews : PreviewProvider {
    static var previews : some View {
        ContentView()
    }
}
