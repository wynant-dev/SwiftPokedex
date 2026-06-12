//
//  TypeStyle.swift
//  SwiftPokedex
//

import SwiftUI
import UIKit

enum TypeStyle {
    static func color(for type: Type) -> Color {
        colors[normalizedName(for: type)] ?? colors["unknown", default: .gray]
    }

    static func symbolName(for type: Type) -> String {
        "type-\(normalizedName(for: type))"
    }

    static func backgroundImageName(for type: Type) -> String? {
        let name = "type-bg-\(normalizedName(for: type))"
        return UIImage(named: name) == nil ? nil : name
    }

    static func displayName(for type: Type) -> String {
        type.name.capitalized
    }

    private static func normalizedName(for type: Type) -> String {
        type.name.lowercased()
    }

    private static let colors: [String: Color] = [
        "normal": Color(red: 0.66, green: 0.66, blue: 0.47),
        "fighting": Color(red: 0.75, green: 0.19, blue: 0.16),
        "flying": Color(red: 0.66, green: 0.56, blue: 0.94),
        "poison": Color(red: 0.63, green: 0.25, blue: 0.63),
        "ground": Color(red: 0.88, green: 0.75, blue: 0.41),
        "rock": Color(red: 0.72, green: 0.63, blue: 0.22),
        "bug": Color(red: 0.66, green: 0.72, blue: 0.13),
        "ghost": Color(red: 0.44, green: 0.35, blue: 0.60),
        "steel": Color(red: 0.72, green: 0.72, blue: 0.82),
        "fire": Color(red: 0.94, green: 0.50, blue: 0.19),
        "water": Color(red: 0.41, green: 0.56, blue: 0.94),
        "grass": Color(red: 0.47, green: 0.78, blue: 0.31),
        "electric": Color(red: 0.97, green: 0.82, blue: 0.19),
        "psychic": Color(red: 0.97, green: 0.35, blue: 0.53),
        "ice": Color(red: 0.60, green: 0.85, blue: 0.85),
        "dragon": Color(red: 0.44, green: 0.22, blue: 0.97),
        "dark": Color(red: 0.44, green: 0.35, blue: 0.28),
        "fairy": Color(red: 0.93, green: 0.60, blue: 0.67),
        "stellar": Color(red: 0.45, green: 0.78, blue: 0.80),
        "unknown": Color(red: 0.41, green: 0.63, blue: 0.56),
    ]
}
