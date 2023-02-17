//
//  BoardView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/12.
//

import SwiftUI

struct BoardView: View {
    
    @EnvironmentObject var imageData: ImageData
    @State private var startIndex = 1
    @State private var didReachEnd: Bool = true
    
    var body: some View {
        ScrollView {
            LayoutView(imageData: imageData.items, didReachEnd: $didReachEnd)
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
                let itemCount = imageData.items.count
                guard let data = data as? ImageEntity else { return }
                let models = data.items.enumerated().map {
                    $0.element.toModel(id: $0.offset + (itemCount == 0 ? 0 : itemCount) )
                }
                DispatchQueue.main.async {
                    imageData.items.append(contentsOf: models)
                    startIndex += display
                }
                completion()
            default:
                print("❌", response)
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
