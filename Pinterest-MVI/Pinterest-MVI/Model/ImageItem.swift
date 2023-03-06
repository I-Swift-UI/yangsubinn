//
//  ImageItem.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import Foundation

struct ImageItem: Hashable {
    let id: Int
    let imageUrl: String
    let title: String
    let isPinned: Bool
}
