//
//  NetworkResult.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/05.
//

import Foundation

enum NetworkResult<T>: Error {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
