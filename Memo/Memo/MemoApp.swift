//
//  MemoApp.swift
//  Memo
//
//  Created by 양수빈 on 2023/01/28.
//

import SwiftUI

@main
struct MemoApp: App {
    var body: some Scene {
        WindowGroup {
            let memo = MemoData()
            ContentView()
                .environmentObject(memo)
        }
    }
}
