//
//  LayoutView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import SwiftUI

struct LayoutView: View {
    
    @Binding var data: [ItemModel]
    var leftData: [ItemModel] = []
    var rightData: [ItemModel] = []
    
    var body: some View {
        let leftData = data.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
        let rightData = data.enumerated().filter { $0.offset % 2 == 1 }.map { $0.element }
        
        HStack(spacing: 10) {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(leftData, id: \.self) { item in
                        ItemView(item: item)
                            .frame(maxHeight: .infinity)
                    }
                }
            }.scrollDisabled(true)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(rightData, id: \.self) { item in
                        ItemView(item: item)
                    }
                }
            }.scrollDisabled(true)
        }
    }
}

//struct LayoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        LayoutView(data: DummyData().items)
//    }
//}
