//
//  NetworkResult.swift
//  Pinterest-MVI
//
//  Created by 양수빈 on 2023/03/06.
//

import Foundation

enum NetworkResult<T>: Error {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
