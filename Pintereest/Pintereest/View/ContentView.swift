//
//  ContentView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: ViewModel = ViewModel()
    @State private var imageList: [ItemModel] = []
    @State private var contentHeight: CGFloat = 0
    @State private var startIndex = 1
    
    var body: some View {
        ScrollView {
//            scrollObservableView
            LayoutView(data: $imageList)
                .background(GeometryReader {
                    Color.clear.preference(key: ScrollOffsetKey.self,
                                           value: -$0.frame(in: .global).origin.y)
                })
        }
        .padding()
        .onAppear {
            getImageData()
        }
        .simultaneousGesture(DragGesture().onChanged({ value in
            print("drag", value)
            getImageData(start: startIndex)
        }))
//        .onPreferenceChange(ScrollOffsetKey.self) {
//            viewModel.setOffset($0)
//        }
    }
    
    /// 이미지 받아오는 서버 통신 함수
    func getImageData(start: Int = 1, display: Int = 40) {
        ImageService.shared.fetchImageSearchData(start: start, display: display) { response in
            switch response {
            case .success(let data):
                guard let data = data as? ImageEntity else { return }
                self.imageList.append(contentsOf: data.items.map { $0.toModel() })
                self.startIndex += display
            default:
                print("❌", response)
            }
        }
    }
    
//    private var scrollObservableView: some View {
//        GeometryReader { proxy in
//            let offsetY = proxy.frame(in: .global).origin.y
//            Color.clear
//                .preference(key: ScrollOffsetKey.self, value: offsetY)
//                .onAppear {
//                    viewModel.setOriginOffset(offsetY)
//                }
//        }
//        .frame(height: 0)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
