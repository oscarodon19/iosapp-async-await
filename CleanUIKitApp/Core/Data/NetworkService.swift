//
//  NetworkService.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func get<T: Decodable>(url: URL) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get<T: Decodable>(url: URL) async throws -> T {
        let urlRequest = URLRequest(url: url)
        let result: (data: Data, response: URLResponse) = try await self.session.data(for: urlRequest)
        
        let statusCode = (result.response as? HTTPURLResponse)?.statusCode
        guard
            let code = statusCode,
            (200..<300) ~= code
        else {
            throw NetworkError.serverError(statusCode: statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: result.data)
    }
}
