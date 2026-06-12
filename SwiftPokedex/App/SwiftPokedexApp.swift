//
//  SwiftPokedexApp.swift
//  SwiftPokedex
//

import SwiftUI

@main
struct SwiftPokedexApp: App {
    private let dependencies = Dependencies()

    var body: some Scene {
        WindowGroup {
            PokedexView(viewModel: dependencies.makePokedexViewModel())
        }
    }
}
