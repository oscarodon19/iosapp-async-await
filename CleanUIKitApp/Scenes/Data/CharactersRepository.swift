//
//  Repository.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import Foundation

protocol CharactersFetchable {
    func fetchCharacters() async throws -> Characters
}

class CharactersRepository: CharactersFetchable {
    
    let networkService: NetworkServiceProtocol
        
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchCharacters() async throws -> Characters {
        guard let url = URL(string: String.characterURL) else {
            throw "The URL could not be created."
        }
        
        return try await self.networkService.get(url: url)
    }
}

fileprivate extension String {
    static var characterURL = "https://rickandmortyapi.com/api/character"
}
