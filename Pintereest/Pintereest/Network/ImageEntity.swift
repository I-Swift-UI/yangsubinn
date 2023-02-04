//
//  ImageEntity.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import Foundation

struct ImageEntity: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [ImageItem]
}

// MARK: - Item
struct ImageItem: Codable {
    let title: String
    let link: String
    let thumbnail: String
    let sizeheight, sizewidth: String
    
    func toModel() -> ItemModel {
        return ItemModel(imageUrl: thumbnail, title: title)
    }
}
