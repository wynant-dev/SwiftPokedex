//
//  PokemonCell.swift
//  SwiftPokedex
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon

    var body: some View {
        HStack(spacing: 12) {
            PokemonImageView(pokemon: pokemon)
                .frame(width: 60, height: 60)
                .background {
                    TypeBackground(types: pokemon.types, opacity: 0.35)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 6) {
                Text(pokemon.name)
                    .font(.headline)

                HStack(spacing: 4) {
                    ForEach(pokemon.types) { type in
                        TypeBadge(type: type, style: .iconOnly)
                    }
                }
            }
        }
    }
}

#Preview {
    List {
        PokemonCell(pokemon: MockPokemonRepository.samplePokemon[0])
    }
}
