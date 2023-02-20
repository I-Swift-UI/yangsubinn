//
//  Tab.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/20.
//

import Foundation

enum Tab: Int, CaseIterable, Identifiable {
    case board = 0
    case pinned = 1
    
    var id: Self.RawValue {
        return self.rawValue
    }
    
    var image: String {
        switch self {
        case .board:
            return "list.bullet"
        case .pinned:
            return "square.and.pencil"
        }
    }
    
    var title: String {
        switch self {
        case .board:
            return "Board"
        case .pinned:
            return "Pinned"
        }
    }
}
