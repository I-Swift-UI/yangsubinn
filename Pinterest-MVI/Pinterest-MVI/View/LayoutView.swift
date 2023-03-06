//
//  LayoutView.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import SwiftUI

struct LayoutView: View {
    
    var imageData: [ImageItem]
    var leftData: [ImageItem] = []
    var rightData: [ImageItem] = []
    
    var body: some View {
        let leftData = imageData.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
        let rightData = imageData.enumerated().filter { $0.offset % 2 == 1 }.map { $0.element }
        LazyVStack {
            HStack(alignment: .top, spacing: 10) {
                VStack(spacing: 10) {
                    ForEach(leftData, id: \.self) { item in
                        ItemView(item: item)
                    }
                }
                VStack(spacing: 10) {
                    ForEach(rightData, id: \.self) { item in
                        ItemView(item: item)
                    }
                }
            }
        }
    }
}
