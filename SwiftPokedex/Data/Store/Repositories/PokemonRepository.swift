//
//  PokemonRepository.swift
//  SwiftPokedex
//

import Foundation
import SwiftData

@ModelActor
actor PokemonRepository: PokemonRepositoryProtocol {
    func fetchPokemon() throws -> [Pokemon] {
        let descriptor = FetchDescriptor<PokemonEntity>(
            sortBy: [SortDescriptor(\.id)]
        )

        let entities = try modelContext.fetch(descriptor)
        let typeEntities = try modelContext.fetch(FetchDescriptor<TypeEntity>())
        let typesByID = Dictionary(uniqueKeysWithValues: typeEntities.map { ($0.id, $0) })

        return entities.map { $0.toDomain(typesByID: typesByID) }
    }
}
