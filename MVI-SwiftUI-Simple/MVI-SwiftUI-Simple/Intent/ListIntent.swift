//
//  ListIntent.swift
//  MVI-SwiftUI-Simple
//
//  Created by 양수빈 on 2023/03/05.
//

import Foundation

class ListIntent {
    
    private weak var model: ListModelActionsProtocol?
    
    init(model: ListModelActionsProtocol) {
        self.model = model
    }
}

extension ListIntent: ListIntentProtocol {
    func viewOnAppear() {
        let number = Int.random(in: 0..<50)
        model?.parse(number: number)
    }
    
    func tappedButton() {
        let number = Int.random(in: 50..<100)
        model?.parse(number: number)
    }
}
