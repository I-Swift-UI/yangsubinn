//
//  ContentView.swift
//  MVI-SwiftUI-Simple
//
//  Created by 양수빈 on 2023/03/05.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var container: MVIContainer<ListIntent, ListModelStateProtocol>
    private var intent: ListIntentProtocol { container.intent }
    private var state: ListModelStateProtocol { container.model }
    
    var body: some View {
        VStack {
            Text(state.text)
                .padding()
                .onAppear {
                    self.intent.viewOnAppear()
                }
            Button(state.retryButton) {
                self.intent.tappedButton()
            }
        }
    }
}

extension ContentView {
    static func build() -> some View {
        let model = ListModel()
        let intent = ListIntent(model: model)
        let container = MVIContainer(intent: intent,
                                     model: model as ListModelStateProtocol,
                                     modelChangedPublisher: model.objectWillChange)
        let view = ContentView(container: container)
        return view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        ContentView.build()
    }
}
