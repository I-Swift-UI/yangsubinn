//
//  ContentView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/03.
//

import SwiftUI

enum Tab {
    case board
    case pinned
}

struct ContentView: View {
    
    @State private var selection: Tab = .board
    
    var body: some View {
        TabView(selection: $selection) {
            BoardView()
                .tabItem({
                    Label("Board", systemImage: "list.bullet")
                })
                .tag(Tab.board)
            
            PinnedView()
                .tabItem({
                    Label("Pinned", systemImage: "pin")
                })
                .tag(Tab.pinned)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
