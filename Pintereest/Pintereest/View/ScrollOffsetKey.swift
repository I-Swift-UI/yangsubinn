//
//  ScrollOffsetKey.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/05.
//

import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
