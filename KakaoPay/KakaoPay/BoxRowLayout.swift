//
//  BoxGridLayout.swift
//  KakaoPay
//
//  Created by 양수빈 on 2023/01/25.
//

import SwiftUI

struct BoxRowLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        let subviewsCount: CGFloat = 3
        
        let spacing: CGFloat = 10
        let size = CGSize(width: (bounds.width - spacing * 2) / subviewsCount, height: bounds.height)
        
        var x = bounds.minX
        
        for index in subviews.indices {
            subviews[index].place(at: CGPoint(x: x, y: bounds.minY),
                                  anchor: .topLeading,
                                  proposal: ProposedViewSize(size))
            x += size.width + spacing
        }
    }
}
