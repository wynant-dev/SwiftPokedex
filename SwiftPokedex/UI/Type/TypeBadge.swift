//
//  TypeBadge.swift
//  SwiftPokedex
//

import SwiftUI

struct TypeBadge: View {
    let type: Type
    var style: Style = .labeled

    enum Style {
        case iconOnly
        case labeled
    }

    var body: some View {
        switch style {
        case .iconOnly:
            iconOnlyBadge
        case .labeled:
            labeledBadge
        }
    }

    private var iconOnlyBadge: some View {
        symbol
            .frame(width: 28, height: 28)
            .background(TypeStyle.color(for: type))
            .clipShape(Circle())
    }

    private var labeledBadge: some View {
        HStack(spacing: 6) {
            symbol
                .frame(width: 20, height: 20)

            Text(TypeStyle.displayName(for: type))
                .font(.subheadline.weight(.semibold))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(TypeStyle.color(for: type))
        .clipShape(Capsule())
    }

    @ViewBuilder
    private var symbol: some View {
        let assetName = TypeStyle.symbolName(for: type)

        if UIImage(named: assetName) != nil {
            Image(assetName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
        } else {
            Text(String(TypeStyle.displayName(for: type).prefix(1)))
                .font(.caption.weight(.bold))
                .foregroundStyle(.white)
        }
    }
}

#Preview("Labeled") {
    HStack {
        TypeBadge(type: Type(id: 10, name: "fire"))
        TypeBadge(type: Type(id: 11, name: "water"))
    }
    .padding()
}

#Preview("Icon only") {
    HStack {
        TypeBadge(type: Type(id: 12, name: "grass"), style: .iconOnly)
        TypeBadge(type: Type(id: 13, name: "electric"), style: .iconOnly)
    }
    .padding()
}
