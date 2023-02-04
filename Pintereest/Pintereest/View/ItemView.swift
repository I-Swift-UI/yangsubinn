//
//  ItemView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import SwiftUI

struct ItemView: View {
    
    var item: ItemModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: item.imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            } placeholder: {
                Text("준비 중")
            }
            Text(item.title)
                .font(.caption)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: ItemModel(imageUrl: "image2", title: "안녕하세용가리"))
    }
}
