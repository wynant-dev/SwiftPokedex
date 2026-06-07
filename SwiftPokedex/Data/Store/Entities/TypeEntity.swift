//
//  TypeEntity.swift
//  SwiftPokedex
//

import SwiftData

@Model
final class TypeEntity {
    @Attribute(.unique) var id: Int
    var name: String

    @Relationship(inverse: \PokemonEntity.types)
    var pokemon: [PokemonEntity]

    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.pokemon = []
    }

    func toDomain() -> Type {
        Type(id: id, name: name)
    }
}
