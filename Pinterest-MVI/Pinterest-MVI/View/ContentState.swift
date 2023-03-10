//
//  ContentState.swift
//  Pinterest-MVI
//
//  Created by μμλΉ on 2023/03/06.
//

import Foundation

enum ContentState {
    case loading
    case content(images: [ImageItem])
    case error
}
