//
//  TypeBackground.swift
//  SwiftPokedex
//

import SwiftUI

struct TypeBackground: View {
    let types: [Type]
    var opacity: Double = 1

    var body: some View {
        Group {
            if let texture = primaryBackgroundTexture {
                Image(texture)
                    .resizable()
                    .scaledToFill()
            } else if types.count >= 2 {
                LinearGradient(
                    colors: types.prefix(2).map { TypeStyle.color(for: $0) },
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            } else if let primary = types.first {
                TypeStyle.color(for: primary)
            } else {
                Color.clear
            }
        }
        .opacity(opacity)
    }

    private var primaryBackgroundTexture: String? {
        types.first.flatMap { TypeStyle.backgroundImageName(for: $0) }
    }
}

#Preview("Single type") {
    TypeBackground(types: [Type(id: 10, name: "fire")])
        .frame(height: 200)
}

#Preview("Dual type") {
    TypeBackground(types: [
        Type(id: 12, name: "grass"),
        Type(id: 4, name: "poison"),
    ])
    .frame(height: 200)
}
