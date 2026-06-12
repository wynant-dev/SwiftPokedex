//
//  Pokemon.swift
//  SwiftPokedex
//

struct Pokemon: Identifiable, Hashable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [Type]
}
