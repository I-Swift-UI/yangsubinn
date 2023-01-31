//
//  Memo.swift
//  Memo
//
//  Created by 양수빈 on 2023/01/28.
//

import Foundation

struct Memo: Hashable, Identifiable {
    var id: Int
    var isLocked: Bool
    var editedDate: String
    var fullContent: String
}
