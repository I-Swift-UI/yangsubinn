//
//  ScrollOffsetKey.swift
//  Pintereest
//
//  Created by μμλΉ on 2023/02/05.
//

import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
