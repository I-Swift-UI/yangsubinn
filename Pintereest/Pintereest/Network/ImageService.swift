//
//  ImageService.swift
//  Pintereest
//
//  Created by 양수빈 on 2023/02/05.
//

import Foundation

struct ImageService {
    static var shared = ImageService()
    
    mutating func fetchImageSearchData(completion: @escaping (NetworkResult<Any>) -> ()) {
        guard var urlComponents = URLComponents(string: "https://openapi.naver.com/v1/search/image") else { return }
        
        let query: [String: String] = ["query": "강아지"]
        let queryItemArray = query.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        urlComponents.queryItems = queryItemArray
        
        guard let requestUrl = urlComponents.url else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue("LK0N0n1VpZWKOEvYxchf", forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("h8E39Hv2UR", forHTTPHeaderField: "X-Naver-Client-Secret")
        
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
}
