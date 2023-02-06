//
//  MasonryView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import SwiftUI
import SwiftUIMasonry

struct MasonryView: View {
    var body: some View {
        ScrollView(.vertical) {
            Masonry(.vertical, lines: 2) {
                Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("image5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

//struct MasonryView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasonryView()
//    }
//}
