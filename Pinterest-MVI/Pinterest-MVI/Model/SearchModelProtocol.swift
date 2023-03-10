//
//  SearchModelProtocol.swift
//  Pinterest-MVI
//
//  Created by μμλΉ on 2023/03/06.
//

import Foundation

protocol SearchModelStateProtocol {
    var contentState: ContentState { get }
    var navigationTitle: String { get }
    var loadingText: String { get }
    var errorText: String { get }
}

protocol SearchModelActionsProtocol: AnyObject {
    func displayLoading()
    func updateImage(images: [ImageItem])
    func displayError()
}
