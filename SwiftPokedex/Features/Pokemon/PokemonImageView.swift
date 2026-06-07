//
//  PokemonImageView.swift
//  SwiftPokedex
//

import SwiftUI

struct PokemonImageView: View {
    let pokemon: Pokemon

    var body: some View {
        AsyncImage(url: pokemon.imageURL) { phase in
            switch phase {
            case .empty:
                placeholder
                    .onAppear(perform: logImageRequest)
            case .failure:
                placeholder
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            @unknown default:
                placeholder
            }
        }
    }

    private var placeholder: some View {
        Image("pokemon-placeholder")
            .resizable()
            .scaledToFit()
    }

    #if DEBUG
    private func logImageRequest() {
        guard let url = pokemon.imageURL else { return }
        print("[PokemonImage] loading #\(pokemon.id) \(pokemon.name): \(url.absoluteString)")
    }
    #endif
}
