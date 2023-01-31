//
//  ContentView.swift
//  Memo
//
//  Created by 양수빈 on 2023/01/28.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var memoData: MemoData
    
    var body: some View {
        let newMemo: Memo = Memo(id: (memoData.dummyData.last?.id ?? 5) + 1,
                                   isLocked: false,
                                   editedDate: "오늘",
                                   fullContent: "")
        
        NavigationView {
            List {
                ForEach(memoData.dummyData) { data in
                    NavigationLink {
                        MemoDetail(memo: data)
                    } label: {
                        MemoRow(memo: data)
                    }
                }
            }
            .navigationTitle("메모")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: MemoDetail(memo: newMemo)) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let memo = MemoData()
        
        ContentView()
            .environmentObject(memo)
    }
}
