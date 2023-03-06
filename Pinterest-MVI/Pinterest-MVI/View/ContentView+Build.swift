//
//  ContentView+Build.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import SwiftUI

extension ContentView {
    static func build() -> some View {
        let model = SearchModel()
        let intent = SearchIntent(model: model)
        let container = MVIContainer(intent: intent as SearchIntentProtocol,
                                     model: model as SearchModelStateProtocol,
                                     modelChangePublisher: model.objectWillChange)
        let view = ContentView(container: container)
        return view
    }
}
