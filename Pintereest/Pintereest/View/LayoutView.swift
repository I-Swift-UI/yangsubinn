//
//  LayoutView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import SwiftUI

struct LayoutView: View {
    
    var data: [ItemModel]
    var leftData: [ItemModel] = []
    var rightData: [ItemModel] = []
    @Binding var didReachEnd: Bool
    
    var body: some View {
        let leftData = data.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
        let rightData = data.enumerated().filter { $0.offset % 2 == 1 }.map { $0.element }
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
//        LayoutView(data: DummyData().items)
//    }
//}
