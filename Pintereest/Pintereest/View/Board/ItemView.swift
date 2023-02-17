//
//  ItemView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import SwiftUI

struct ItemView: View {
    
    var item: ItemModel
    @State var isSelected: Bool = false
    @EnvironmentObject var imageData: ImageData
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: item.imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            } placeholder: {
                Text("준비 중")
                    .foregroundColor(Color.gray)
            }
            HStack {
                Text(item.title)
                    .font(.caption)
                    .lineLimit(2)
                Spacer()
                Button {
                    self.isSelected.toggle()
                    let new = ItemModel(id: item.id, imageUrl: item.imageUrl, title: item.title, isPinned: item.isPinned ? false : true)
                    imageData.items[item.id] = new
                } label: {
                    Image(systemName: "pin.fill")
                        .foregroundColor(self.isSelected ? Color.blue : Color.gray)
                }
            }
        }
        .onAppear {
            isSelected = item.isPinned
        }
    }
}

//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemView(index: 0, item: ItemModel(imageUrl: "image2", title: "안녕하세용가리안녕하세용가리안녕하세용", isPinned: false, imageData: <#Binding<ImageData>#>))
//    }
//}
