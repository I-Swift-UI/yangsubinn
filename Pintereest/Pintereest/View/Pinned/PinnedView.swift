//
//  PinnedView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/12.
//

import SwiftUI

struct PinnedView: View {
    
    @EnvironmentObject var imageData: ImageData
    @State private var didReachEnd: Bool = true
    
    var body: some View {
        ScrollView {
//            LazyVStack {
//                ForEach(Array(zip(imageData.items.indices, imageData.items)), id: \.0) { index, item in
//                    if item.isPinned {
//                        ItemView(item: item)
//                    }
//                }
//            }
            
            // FIXME: - pinnedView에서 저장 취소했을때 index 꼬임
            LayoutView(imageData: imageData.items.filter({ $0.isPinned }), didReachEnd: $didReachEnd)
        }
        .padding()
    }
}

struct PinnedView_Previews: PreviewProvider {
    static var previews: some View {
        PinnedView()
            .environmentObject(ImageData())
    }
}
