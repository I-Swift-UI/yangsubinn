//
//  ItemModel.swift
//  Pintereest
//
//  Created by μμλΉ on 2023/02/04.
//

import Foundation

struct ItemModel: Hashable {
    let id: Int
    let imageUrl: String
    let title: String
    let isPinned: Bool
}
