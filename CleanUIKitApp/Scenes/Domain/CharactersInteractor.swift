//
//  Interactor.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import Foundation

protocol CharactersInteractorProtocol {
    func fetchCharacters() async throws -> [Character]
}

class CharactersInteractor: CharactersInteractorProtocol {
    private let repository: CharactersFetchable
    
    init(repository: CharactersFetchable = CharactersRepository()) {
        self.repository = repository
    }
    
    func fetchCharacters() async throws -> [Character] {
        try await repository.fetchCharacters().results
    }
}
