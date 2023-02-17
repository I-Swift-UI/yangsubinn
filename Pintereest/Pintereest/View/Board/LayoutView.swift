//
//  LayoutView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import SwiftUI

struct LayoutView: View {
    
    var imageData: [ItemModel]
    var leftData: [ItemModel] = []
    var rightData: [ItemModel] = []
    @Binding var didReachEnd: Bool
    
    var body: some View {
        let leftData = imageData.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
        let rightData = imageData.enumerated().filter { $0.offset % 2 == 1 }.map { $0.element }
        LazyVStack {
            HStack(alignment: .top, spacing: 10) {
                VStack(spacing: 10) {
//                    ForEach(Array(zip(leftData.indices, leftData)), id: \.0) { index, item in
//                        ItemView(item: item, index: index*2)
//                    }
                    ForEach(leftData, id: \.self) { item in
                        ItemView(item: item)
                    }
                }
                VStack(spacing: 10) {
//                    ForEach(Array(zip(rightData.indices, rightData)), id: \.0) { index, item in
//                        ItemView(item: item, index: index*2+1)
//                    }
                    
                    ForEach(rightData, id: \.self) { item in
                        ItemView(item: item)
                    }
                }
            }
            Color.clear
                .frame(width: 0, height: 0)
                .onAppear {
                    didReachEnd = true
                }
        }
    }
}

//struct LayoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        LayoutView(didReachEnd: <#Binding<Bool>#>)
//    }
//}
