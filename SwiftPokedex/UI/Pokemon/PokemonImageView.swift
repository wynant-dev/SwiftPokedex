//
//  PokemonImageView.swift
//  SwiftPokedex
//

import Kingfisher
import SwiftUI

struct PokemonImageView: View {
    let pokemon: Pokemon

    var body: some View {
        if let url = pokemon.imageURL {
            KFImage(url)
                .placeholder { placeholderImageView }
                .resizable()
                .scaledToFit()
        } else {
            placeholderImageView
        }
    }

    private var placeholderImageView: some View {
        Image("pokemon-placeholder")
            .resizable()
            .scaledToFit()
    }
}
