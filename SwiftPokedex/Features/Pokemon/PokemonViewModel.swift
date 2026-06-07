//
//  PokemonViewModel.swift
//  SwiftPokedex
//

import Foundation

@MainActor
@Observable
final class PokemonViewModel {
    
    private let repository: PokemonRepositoryProtocol
    private(set) var pokemon: [Pokemon]

    init(
        repository: PokemonRepositoryProtocol,
        pokemon: [Pokemon] = []
    ) {
        self.repository = repository
        self.pokemon = pokemon
    }

    func load() {
        do {
            pokemon = try repository.fetchPokemon()
        } catch {
            pokemon = []
        }
    }
}
