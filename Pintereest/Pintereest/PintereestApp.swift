//
//  PintereestApp.swift
//  Pintereest
//
//  Created by μμλΉ on 2023/02/03.
//

import SwiftUI

@main
struct PintereestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ImageData())
        }
    }
}
