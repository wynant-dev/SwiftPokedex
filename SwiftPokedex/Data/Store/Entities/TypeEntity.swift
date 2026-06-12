//
//  TypeEntity.swift
//  SwiftPokedex
//

import SwiftData

@Model
final class TypeEntity {
    @Attribute(.unique) var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    func toDomain() -> Type {
        Type(id: id, name: name)
    }
}
