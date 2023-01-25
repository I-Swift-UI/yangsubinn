//
//  BoxGridLayout.swift
//  KakaoPay
//
//  Created by 양수빈 on 2023/01/25.
//

import SwiftUI

struct BoxGridLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        let rowitemCount = 3
        let spacing: CGFloat = 10
        let length = (bounds.width - spacing * CGFloat((rowitemCount - 1))) / CGFloat(rowitemCount)
        
        var x = bounds.minX
        var y = bounds.minY
        
        for index in subviews.indices {
            subviews[index].place(at: CGPoint(x: x, y: y),
                                  anchor: .topLeading,
                                  proposal: ProposedViewSize(CGSize(width: length, height: length)))
            if index % rowitemCount == rowitemCount - 1 {
                x = bounds.minX
                y += length + spacing
            } else {
                x += length + spacing
            }
        }
    }
}
