//
//  Pokemon.swift
//  SwiftPokedex
//

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [Type]
}
