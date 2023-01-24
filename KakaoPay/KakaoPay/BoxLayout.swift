//
//  BoxLayout.swift
//  KakaoPay
//
//  Created by 양수빈 on 2023/01/24.
//

import SwiftUI

// Layout, ProposedViewSize 16.0부터 가능
struct BoxLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        let spacing: CGFloat = 10
        let minSize = CGSize(width: (bounds.width - spacing * 2) / 3, height: (bounds.height - spacing * 2) / 3)
        let midSize = CGSize(width: bounds.width, height: minSize.height)
        let maxSize = CGSize(width: minSize.width * 2 + spacing, height: minSize.height * 2 + spacing)
        
        let x = bounds.minX
        let y = bounds.minY
        
        var sizeProposal = ProposedViewSize(maxSize)
        
        for index in subviews.indices {
            switch index {
            case 0:
                subviews[index].place(at: CGPoint(x: x, y: y),
                                      anchor: .topLeading,
                                      proposal: sizeProposal)
            case 1:
                sizeProposal = ProposedViewSize(minSize)
                subviews[index].place(at: CGPoint(x: x + maxSize.width + spacing, y: y),
                                      anchor: .topLeading,
                                      proposal: sizeProposal)
            case 2:
                sizeProposal = ProposedViewSize(minSize)
                subviews[index].place(at: CGPoint(x: x + maxSize.width + spacing, y: y + minSize.height + spacing),
                                      anchor: .topLeading,
                                      proposal: sizeProposal)
            case 3:
                sizeProposal = ProposedViewSize(midSize)
                subviews[index].place(at: CGPoint(x: x, y: y + maxSize.height + spacing),
                                      anchor: .topLeading,
                                      proposal: sizeProposal)
            default:
                break
            }
        }
    }
}
