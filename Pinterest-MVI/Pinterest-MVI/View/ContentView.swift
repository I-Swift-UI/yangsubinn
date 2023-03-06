//
//  ContentView.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var container: MVIContainer<SearchIntentProtocol, SearchModelStateProtocol>
    private var state: SearchModelStateProtocol { container.model }
    private var intent: SearchIntentProtocol { container.intent }
    
    var body: some View {
        NavigationView {
            ZStack {
                switch state.contentState {
                case .loading:
                    Text(state.loadingText)
                case .content(let images):
                    ScrollView {
                        LayoutView(imageData: images)
                            .padding()
                    }
                default:
                    Text(state.errorText)
                }
            }
            .onAppear {
                intent.viewOnAppear()
            }
            .navigationTitle(state.navigationTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView.build()
    }
}
