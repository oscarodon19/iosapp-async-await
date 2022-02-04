//
//  NetworkError.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import Foundation

enum NetworkError: Error {
    case serverError(statusCode: Int?)
    case noDataReceived
    case decodingError(DecodingError)
    case unknowError(Error)
}
