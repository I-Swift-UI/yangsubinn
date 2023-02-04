//
//  ContentView.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dummyData: DummyData
    @State private var imageList: [ItemModel] = []
    
    var body: some View {
//        ScrollView {
//            LayoutView(data: dummyData.items)
//        }
//        .padding()
        
        ScrollView {
            LayoutView(data: $imageList)
        }
        .padding()
        .onAppear {
            getImageData()
        }
    }
    
    func getImageData() {
        ImageService.shared.fetchImageSearchData { response in
            switch response {
            case .success(let data):
                print("data: - ", data)
                guard let data = data as? ImageEntity else { return }
                self.imageList = data.items.map { $0.toModel() }
            default:
                print("❌", response)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DummyData())
    }
}
