//
//  PokemonDTO.swift
//  SwiftPokedex
//

struct PokemonDTO: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [Int]
}
