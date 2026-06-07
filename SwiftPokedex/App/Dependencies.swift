//
//  Dependencies.swift
//  SwiftPokedex
//

import Foundation
import SwiftData

final class Dependencies {
    let modelContainer: ModelContainer

    init() {
        do {
            self.modelContainer = try SwiftDataStore.makeContainer()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    func makePokemonRepository() -> PokemonRepository {
        PokemonRepository(context: modelContainer.mainContext)
    }

    func makePokemonViewModel() -> PokemonViewModel {
        PokemonViewModel(repository: makePokemonRepository())
    }
}
