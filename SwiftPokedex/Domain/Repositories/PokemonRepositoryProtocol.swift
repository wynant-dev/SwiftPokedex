//
//  PokemonRepositoryProtocol.swift
//  SwiftPokedex
//

import Foundation

protocol PokemonRepositoryProtocol {
    func fetchPokemon() throws -> [Pokemon]
}
