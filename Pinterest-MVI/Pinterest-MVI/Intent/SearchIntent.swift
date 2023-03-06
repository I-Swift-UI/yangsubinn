//
//  SearchIntent.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import SwiftUI

class SearchIntent {
    private weak var model: SearchModelActionsProtocol?
    
    init(model: SearchModelActionsProtocol) {
        self.model = model
    }
}

extension SearchIntent: SearchIntentProtocol {
    func viewOnAppear() {
        model?.displayLoading()
        
        ImageService.shared.fetchImageSearchData { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                guard let data = data as? ImageEntity else { return }
                let images = data.items.map { $0.toModel(id: 0) }
                self.model?.updateImage(images: images)
            default:
                self.model?.displayError()
            }
        }
    }
}
