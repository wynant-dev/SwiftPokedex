//
//  PokedexViewModel.swift
//  SwiftPokedex
//

import Foundation

@MainActor
@Observable
final class PokedexViewModel {

    private let repository: PokemonRepositoryProtocol

    private(set) var pokemon: [Pokemon] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }

    func load() async {
        isLoading = true
        errorMessage = nil

        do {
            pokemon = try await repository.fetchPokemon()
        } catch {
            errorMessage = error.localizedDescription
            pokemon = []
        }

        isLoading = false
    }
}
