//
//  CharacterDTO.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import Foundation

struct Characters: Decodable {
    let results: [Character]
}

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let species: String
}
