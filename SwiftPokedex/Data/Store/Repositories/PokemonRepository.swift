//
//  PokemonRepository.swift
//  SwiftPokedex
//

import Foundation
import SwiftData

final class PokemonRepository: PokemonRepositoryProtocol {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchPokemon() throws -> [Pokemon] {
        let descriptor = FetchDescriptor<PokemonEntity>(
            sortBy: [SortDescriptor(\.id)]
        )
        return try context.fetch(descriptor).map { $0.toDomain() }
    }
}
