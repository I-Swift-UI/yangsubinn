//
//  ViewModel.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/05.
//

import SwiftUI

final class ViewModel: ObservableObject {
    var offset: CGFloat = 0
    var originOffset: CGFloat = 0
    var isCheckedOriginOffset: Bool = false
    
    func setOriginOffset(_ offset: CGFloat) {
        guard !isCheckedOriginOffset else { return }
        self.originOffset = offset
        isCheckedOriginOffset = true
    }
    
    func setOffset(_ offset: CGFloat) {
        self.offset = offset
    }
}
