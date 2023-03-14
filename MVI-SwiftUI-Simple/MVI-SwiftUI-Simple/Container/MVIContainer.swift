//
//  MVIContainer.swift
//  MVI-SwiftUI-Simple
//
//  Created by 양수빈 on 2023/03/05.
//

import SwiftUI
import Combine

final class MVIContainer<Intent, Model>: ObservableObject {
    
    let intent: Intent
    let model: Model
    
    private var cancellable: Set<AnyCancellable> = []
    
    init(intent: Intent, model: Model, modelChangedPublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model
        
        modelChangedPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}
