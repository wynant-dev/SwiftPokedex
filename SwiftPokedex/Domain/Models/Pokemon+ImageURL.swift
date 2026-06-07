//
//  Pokemon+ImageURL.swift
//  SwiftPokedex
//

import Foundation

extension Pokemon {
    var imageURL: URL? {
        let formattedID = String(format: "%03d", id)
        return URL(
            string: "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/\(formattedID).png"
        )
    }
}
