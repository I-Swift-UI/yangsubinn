//
//  ListModel.swift
//  MVI-SwiftUI-Simple
//
//  Created by 양수빈 on 2023/03/05.
//

import SwiftUI

final class ListModel: ObservableObject, ListModelStateProtocol, ListModelActionsProtocol {
    
    @Published var text: String = ""
    var retryButton: String = "랜덥값 다시 뽑기"
    
    func parse(number: Int) {
        text = "Random numbers: " + String(number)
    }
}
