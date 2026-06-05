//
//  ContentView.swift
//  SwiftPokedex
//
    
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Swift Pokedex")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    ContentView()
}
