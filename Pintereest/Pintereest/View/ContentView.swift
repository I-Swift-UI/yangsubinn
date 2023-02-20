//
//  ContentView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .board
    
    var body: some View {
        
        // MARK: - System Tabbar
        
//        TabView(selection: $selectedTab) {
//            BoardView()
//                .tabItem({
//                    Label("Board", systemImage: "list.bullet")
//                })
//                .tag(Tab.board)
//
//            PinnedView()
//                .tabItem({
//                    Label("Pinned", systemImage: "pin")
//                })
//                .tag(Tab.pinned)
//        }
        
        // MARK: - Custom Tabbar
        
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .board:
                BoardView()
            case .pinned:
                PinnedView()
            }
            
            HStack {
                Spacer()
                ForEach(Tab.allCases) { item in
                    VStack(spacing: 4) {
                        Image(systemName: item.image)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(selectedTab == item ? Color(.systemBlue) : Color(.tertiaryLabel))
                        Text(item.title)
                            .font(.system(size: 9, weight: .light))
                            .foregroundColor(selectedTab == item ? Color(.systemBlue) : Color(.tertiaryLabel))
                    }
                    .gesture(TapGesture().onEnded({ _ in
                        selectedTab = item
                    }))
                    Spacer()
                }
            }
            .modifier(TabModifier())
        }
    }
}

struct TabModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 62)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: Color(.systemGray4).opacity(0.6), radius: 4)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
