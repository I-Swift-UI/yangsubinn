//
//  ListIntentProtocol.swift
//  MVI-SwiftUI-Simple
//
//  Created by 양수빈 on 2023/03/05.
//

import Foundation

/// View에서 발생할 event 받아오기 위한 Protocol
protocol ListIntentProtocol {
    func viewOnAppear()
    func tappedButton()
}
