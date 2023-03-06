//
//  ItemView.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import SwiftUI

struct ItemView: View {
    
    var item: ImageItem
    @State var isSelected: Bool = false
    
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
