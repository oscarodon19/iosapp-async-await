//
//  ViewModel.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import Foundation
import UIKit

protocol ViewModelProtocol {
    func viewDidLoad() async
}

class CharactersViewModel: ViewModelProtocol, ObservableObject, Identifiable {
    
    var characters: [Character] = []
    
    private let interactor: CharactersInteractorProtocol
    
    init(interactor: CharactersInteractorProtocol = CharactersInteractor()) {
        self.interactor = interactor
    }
        
    @MainActor
    func viewDidLoad() async {
        do {
            characters = try await interactor.fetchCharacters()
        } catch {
            print(error.localizedDescription)
        }
    }
}
