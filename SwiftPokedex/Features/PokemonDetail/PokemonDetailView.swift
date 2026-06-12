//
//  PokemonDetailView.swift
//  SwiftPokedex
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                PokemonImageView(pokemon: pokemon)
                    .frame(maxWidth: 280, maxHeight: 280)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        TypeBackground(types: pokemon.types, opacity: 0.25)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                typesSection

                statsSection
            }
            .padding()
        }
        .background {
            TypeBackground(types: pokemon.types, opacity: 0.08)
                .ignoresSafeArea()
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.large)
    }

    private var typesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Types")
                .font(.headline)

            HStack(spacing: 8) {
                ForEach(pokemon.types) { type in
                    TypeBadge(type: type)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Stats")
                .font(.headline)

            LabeledContent("Height", value: "\(pokemon.height)")
            LabeledContent("Weight", value: "\(pokemon.weight)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        PokemonDetailView(pokemon: MockPokemonRepository.samplePokemon[0])
    }
}
