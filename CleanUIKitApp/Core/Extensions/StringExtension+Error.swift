//
//  StringExtension+Error.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
