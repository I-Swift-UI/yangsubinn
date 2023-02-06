//
//  DummyData.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/04.
//

import Foundation

class DummyData: ObservableObject {
    @Published var items: [ItemModel] = [ItemModel(imageUrl: "image1", title: "image1"),
                                         ItemModel(imageUrl: "image2", title: "image2"),
                                         ItemModel(imageUrl: "image3", title: "image3"),
                                         ItemModel(imageUrl: "image4", title: "image4"),
                                         ItemModel(imageUrl: "image5", title: "image5"),
                                         ItemModel(imageUrl: "image6", title: "image6"),
                                         ItemModel(imageUrl: "image7", title: "image7"),
                                         ItemModel(imageUrl: "image8", title: "image8")]
}
