//
//  SearchModel.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import Foundation

final class SearchModel: ObservableObject, SearchModelStateProtocol {
    
    @Published var contentState: ContentState = .loading
    @Published var navigationTitle: String = "검색 중.."
    let loadingText: String = "잠시만 기다려주세요💨"
    let errorText: String = "사진 불러오기에 실패했습니다🥺"
}

extension SearchModel: SearchModelActionsProtocol {
    func displayLoading() {
        contentState = .loading
    }
    
    func updateImage(images: [ImageItem]) {
        navigationTitle = "검색 결과🔍"
        contentState = .content(images: images)
    }
    
    func displayError() {
        navigationTitle = "에러 발생"
        contentState = .error
    }
}
