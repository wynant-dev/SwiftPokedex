//
//  MockPokemonRepository.swift
//  SwiftPokedex
//

import Foundation

struct MockPokemonRepository: PokemonRepositoryProtocol {
    func fetchPokemon() throws -> [Pokemon] {
        Self.samplePokemon
    }
}

extension MockPokemonRepository {
    static let samplePokemon: [Pokemon] = [
        Pokemon(
            id: 1,
            name: "Bulbasaur",
            height: 7,
            weight: 69,
            types: [
                Type(id: 1, name: "Grass"),
                Type(id: 2, name: "Poison"),
            ]
        ),
        Pokemon(
            id: 4,
            name: "Charmander",
            height: 6,
            weight: 85,
            types: [Type(id: 3, name: "Fire")]
        ),
        Pokemon(
            id: 7,
            name: "Squirtle",
            height: 5,
            weight: 90,
            types: [Type(id: 4, name: "Water")]
        ),
    ]
}
