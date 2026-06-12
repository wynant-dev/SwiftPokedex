//
//  Dependencies.swift
//  SwiftPokedex
//

import Foundation
import SwiftData

final class Dependencies {

    let modelContainer: ModelContainer

    private lazy var pokemonRepository: PokemonRepository = {
        PokemonRepository(modelContainer: modelContainer)
    }()

    init() {
        self.modelContainer = try! SwiftDataStore.makeContainer()
    }

    func makePokedexViewModel() -> PokedexViewModel {
        PokedexViewModel(repository: pokemonRepository)
    }
}
