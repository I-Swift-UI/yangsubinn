//
//  MemoData.swift
//  Memo
//
//  Created by 양수빈 on 2023/01/28.
//

import Foundation

class MemoData: ObservableObject {
    @Published var dummyData: [Memo] = [
        Memo(id: 0, isLocked: true, editedDate: "오늘", fullContent: "메모1\n하나둘셋넷"),
        Memo(id: 1, isLocked: false, editedDate: "오늘", fullContent: "메모2\n하나둘셋넷다섯여섯일곱여덟아홉하나둘셋넷다섯여섯일곱여덟아홉")]
}
