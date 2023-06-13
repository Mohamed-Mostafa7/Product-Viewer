//
//  ApiService.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 12/06/2023.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidData
}

struct APIRequest<T: Decodable> {
    let url: URL
    
    func execute() -> Observable<T> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: self.url) { data, response, error in
                
                if let error = error {
                    observer.onError(APIError.networkError(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    observer.onError(APIError.invalidResponse)
                    return
                }
                
                guard 200..<300 ~= httpResponse.statusCode else {
                    observer.onError(APIError.invalidResponse)
                    return
                }
                
                guard let data = data else {
                    observer.onError(APIError.invalidData)
                    return
                }
                
                do {
                    print(data.description)
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    print(decodedData)
                    observer.onNext(decodedData)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
