//
//  MemoDetail.swift
//  Memo
//
//  Created by 양수빈 on 2023/01/28.
//

import SwiftUI
import UIKit

struct MemoDetail: View {
    
    // MARK: - @EnvironmentObject
    // 필요한 어디에든 모델을 공유 가능
    @EnvironmentObject var memoData: MemoData
    var memo: Memo
    var memoIndex: Int {
        memoData.dummyData.firstIndex(where: { $0.id == memo.id }) ?? -1
    }
    
    // MARK: - @State
    // State(상태)가 변하면 뷰를 다시 그림(데이터가 변경될때 뷰에 자동 업데이트)
    @State private var newMemo: Bool = false
    @State private var memoContent: String = ""
    
    // MARK: - @FocusState
    // 키보드 올라왔는지, 내려갔는지 상태 설정하거나 가져오는 변수
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $memoContent)
                .keyboardType(.default)
                .focused($isFocused)
            Spacer()
            HStack {
                Button(action: { print("checklist") }, label: { Image(systemName: "checklist").resizable().frame(width: 22, height: 22) })
                Spacer()
                Button(action: { print("camera") }, label: { Image(systemName: "camera").resizable().frame(width: 22, height: 22) })
                Spacer()
                Button(action: { print("pencil") }, label: { Image(systemName: "pencil.tip.crop.circle").resizable().frame(width: 22, height: 22) })
                Spacer()
                Button(action: {
                    memoContent = ""
                    newMemo = true
                    isFocused = true
                }, label: {
                    Image(systemName: "square.and.pencil").resizable().frame(width: 22, height: 22)
                })
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .frame(height: 48)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if $isFocused.wrappedValue {
                Button("완료") {
                    isFocused = false
                    if newMemo {
                        let new = Memo(id: (memoData.dummyData.last?.id ?? 0) + 1, isLocked: false, editedDate: "오늘", fullContent: memoContent)
                        memoData.dummyData.append(new)
                    } else {
                        memoData.dummyData[memoIndex].fullContent = memoContent
                    }
                }
            }
        }
        .onAppear {
            if memoIndex > -1 {
                memoContent = memoData.dummyData[memoIndex].fullContent
            } else {
                newMemo = true
            }
        }
    }
}

struct MemoDetail_Previews: PreviewProvider {
    static var previews: some View {
        let memoData = MemoData()
        MemoDetail(memo: memoData.dummyData[0])
            .environmentObject(MemoData())
    }
}
