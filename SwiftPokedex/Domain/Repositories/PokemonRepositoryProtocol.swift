//
//  PokemonRepositoryProtocol.swift
//  SwiftPokedex
//

import Foundation

protocol PokemonRepositoryProtocol {
    func fetchPokemon() async throws -> [Pokemon]
}
