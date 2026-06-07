//
//  PokemonView.swift
//  SwiftPokedex
//

import SwiftUI

struct PokemonView: View {
    @Bindable var viewModel: PokemonViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.pokemon) { pokemon in
                HStack(spacing: 12) {
                    PokemonImageView(pokemon: pokemon)
                        .frame(width: 60, height: 60)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(pokemon.name)
                            .font(.headline)
                        Text(pokemon.types.map(\.name).joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Swift Pokedex")
        }
        .onAppear {
            viewModel.load()
        }
    }
}

#Preview {
    PokemonView(
        viewModel: PokemonViewModel(
            repository: MockPokemonRepository(),
            pokemon: MockPokemonRepository.samplePokemon
        )
    )
}
