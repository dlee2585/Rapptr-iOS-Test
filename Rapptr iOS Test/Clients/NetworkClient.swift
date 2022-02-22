//
//  NetworkClient.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/18/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case failToParseJSON
    case genericError
}

class NetworkClient {
    func performRequest<T: Decodable>(with urlString: String, _ type: T.Type, onCompletion: @escaping (T) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: urlString) else {
            onError(NetworkError.invalidURL)
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                onError(error)
                return
            }
            
            guard let safeData = data, let result: T = self?.parseJSON(safeData) else {
                onError(NetworkError.failToParseJSON)
                return
            }
        
            onCompletion(result)
        }
        
        task.resume()
    }
    
    private func parseJSON<T: Decodable>(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
