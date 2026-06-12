//
//  PokedexView.swift
//  SwiftPokedex
//

import SwiftUI

struct PokedexView: View {

    @State private var viewModel: PokedexViewModel

    init(viewModel: PokedexViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            List(viewModel.pokemon) { pokemon in
                NavigationLink(value: pokemon) {
                    PokemonCell(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokédex")
            .navigationDestination(for: Pokemon.self) { pokemon in
                PokemonDetailView(pokemon: pokemon)
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    PokedexView(
        viewModel: PokedexViewModel(
            repository: MockPokemonRepository(),
        )
    )
}
