//
//  MemoRow.swift
//  Memo
//
//  Created by 양수빈 on 2023/01/28.
//

import SwiftUI

struct MemoRow: View {
    var memo: Memo
    
    var body: some View {
        HStack(alignment: .top) {
            let image = Image(systemName: "lock").tag("image")
            
            if memo.isLocked {
                image
            } else {
                image.hidden()
            }
            let fullContent = memo.fullContent.components(separatedBy: "\n")
            let title = fullContent.first
            let preview = fullContent[1...].joined(separator: "\n")
            
            VStack(alignment: .leading) {
                Text(title ?? "")
                    .fontWeight(.medium)
                HStack {
                    Text(memo.editedDate)
                    Text(preview).lineLimit(1)
                    Spacer()
                }
                .font(.subheadline)
                .foregroundColor(Color.gray)
            }
        }
    }
}

struct MemoRow_Previews: PreviewProvider {
    static var previews: some View {
        MemoRow(memo: Memo(id: 0, isLocked: true, editedDate: "작성일", fullContent: "메모제목\n곰탱이"))
    }
}
