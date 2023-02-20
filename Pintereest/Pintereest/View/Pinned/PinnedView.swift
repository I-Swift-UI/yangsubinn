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
            LayoutView(imageData: imageData.items.filter({ $0.isPinned }), didReachEnd: $didReachEnd)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
    }
}

struct PinnedView_Previews: PreviewProvider {
    static var previews: some View {
        PinnedView()
            .environmentObject(ImageData())
    }
}
