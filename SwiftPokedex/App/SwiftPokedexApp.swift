//
//  SwiftPokedexApp.swift
//  SwiftPokedex
//

import SwiftData
import SwiftUI

@main
struct SwiftPokedexApp: App {
    private let dependencies = Dependencies()

    var body: some Scene {
        WindowGroup {
            PokemonView(viewModel: dependencies.makePokemonViewModel())
        }
    }
}
