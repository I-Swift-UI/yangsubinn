//
//  ImageService.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/05.
//

import Foundation

struct ImageService {
    static var shared = ImageService()
    
    private let baseURL = "https://openapi.naver.com/v1/search/image"
    private let clientId = "LK0N0n1VpZWKOEvYxchf"
    private let clientSecret = "h8E39Hv2UR"
    
    mutating func fetchImageSearchData(start: Int = 1, display: Int = 40, completion: @escaping (NetworkResult<Any>) -> ()) {
        guard var urlComponents = URLComponents(string: baseURL) else { return }
        
        let query: [String: String] = ["query": "강아지",
                                       "start": String(start),
                                       "display": String(display)]
        let queryItemArray = query.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        urlComponents.queryItems = queryItemArray
        
        guard let requestUrl = urlComponents.url else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                do {
                    let decodedData = try JSONDecoder().decode(ImageEntity.self, from: safeData)
                    completion(.success(decodedData))
                } catch(let err) {
                    print("err -", err)
                }
            }
        }
        
        dataTask.resume()
    }
    
    mutating func fetchImageSearchDataConcurrency(start: Int = 1, display: Int = 40) async throws -> NetworkResult<Any> {
        var urlComponents = URLComponents(string: baseURL)
        
        let query: [String: String] = ["query": "강아지",
                                       "start": String(start),
                                       "display": String(display)]
        let queryItemArray = query.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        urlComponents?.queryItems = queryItemArray
        
        guard let requestUrl = urlComponents?.url else { return .networkFail }
        var request = URLRequest(url: requestUrl)
        request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let session = URLSession(configuration: .default)
        
        let (data, response) = try await session.data(for: request)
        
        guard let urlResponse = response as? HTTPURLResponse,
              urlResponse.statusCode == 200 else { return .pathErr }

        guard let decodedData = try? JSONDecoder().decode(ImageEntity.self, from: data) else { return .serverErr }

        return .success(decodedData)
    }
}
