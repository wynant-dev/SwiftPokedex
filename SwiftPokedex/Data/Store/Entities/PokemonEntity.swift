//
//  PokemonEntity.swift
//  SwiftPokedex
//

import SwiftData

@Model
final class PokemonEntity {
    @Attribute(.unique) var id: Int
    var name: String
    var height: Int
    var weight: Int

    @Relationship var types: [TypeEntity]

    init(id: Int, name: String, height: Int, weight: Int) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.types = []
    }

    func toDomain() -> Pokemon {
        Pokemon(
            id: id,
            name: name,
            height: height,
            weight: weight,
            types: types.map { $0.toDomain() }
        )
    }
}
