//
//  ContentView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var imageList: [ItemModel] = []
    @State private var contentHeight: CGFloat = 0
    @State private var startIndex = 1
    @State var didReachEnd: Bool = true
    
    var body: some View {
        ScrollView {
            LayoutView(data: imageList, didReachEnd: $didReachEnd)
                .onChange(of: didReachEnd) { newValue in
                    if didReachEnd {
                        getImageData(start: startIndex) {
                            didReachEnd = false
                        }
                    }
                }
        }
        .padding()
        .onAppear {
            if didReachEnd {
                getImageData {
                    didReachEnd = false
                }
            }
        }
    }
    
    /// 이미지 받아오는 서버 통신 함수
    func getImageData(start: Int = 1, display: Int = 10, completion: @escaping (() -> Void)) {
        ImageService.shared.fetchImageSearchData(start: start, display: display) { response in
            switch response {
            case .success(let data):
                guard let data = data as? ImageEntity else { return }
                self.imageList.append(contentsOf: data.items.map { $0.toModel() })
                self.startIndex += display
                completion()
            default:
                print("❌", response)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(didReachEnd: false)
    }
}
