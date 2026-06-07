//
//  StoreSeeder.swift
//  SwiftPokedex
//

import Foundation
import SwiftData

struct StoreSeeder {
    private let context: ModelContext
    private let bundle: Bundle
    private var types: [Int: TypeEntity] = [:]
    private var pokemons: [Int: PokemonEntity] = [:]

    init(context: ModelContext, bundle: Bundle = .main) {
        self.context = context
        self.bundle = bundle
    }

    mutating func seedIfNeeded() throws {
        guard try isDatabaseEmpty else { return }
        try seed()
    }

    private var isDatabaseEmpty: Bool {
        get throws {
            var descriptor = FetchDescriptor<TypeEntity>()
            descriptor.fetchLimit = 1
            return try context.fetch(descriptor).isEmpty
        }
    }

    mutating func seed() throws {
        try seedTypes()
        try seedPokemon()
        try context.save()
    }

    private mutating func seedTypes() throws {
        let dtos = try JSONLoader.load("type", as: [TypeDTO].self, bundle: bundle)

        for dto in dtos {
            let type = TypeEntity(id: dto.id, name: dto.name)
            context.insert(type)
            types[dto.id] = type
        }
    }

    private mutating func seedPokemon() throws {
        let dtos = try JSONLoader.load("pokemon", as: [PokemonDTO].self, bundle: bundle)

        for dto in dtos {
            let pokemon = PokemonEntity(
                id: dto.id,
                name: dto.name,
                height: dto.height,
                weight: dto.weight
            )
            pokemon.types = dto.types.compactMap { types[$0] }
            context.insert(pokemon)
            pokemons[dto.id] = pokemon
        }
    }
}
