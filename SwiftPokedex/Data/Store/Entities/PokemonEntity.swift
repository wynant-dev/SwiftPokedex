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
    var typeIDs: [Int]

    init(id: Int, name: String, height: Int, weight: Int) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.typeIDs = []
    }

    func toDomain(typesByID: [Int: TypeEntity]) -> Pokemon {
        Pokemon(
            id: id,
            name: name,
            height: height,
            weight: weight,
            types: typeIDs.compactMap { typesByID[$0]?.toDomain() }
        )
    }
}
