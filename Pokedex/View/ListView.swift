//
//  ContentView.swift
//  Pokedex
//
//  Created by Francesco Merola on 11/05/23.
//

import SwiftUI

struct ListView: View {
    
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                List {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(destination: DetailView(pokemon: pokemon, viewModel: viewModel)) {
                                Text(pokemon.name.capitalized)
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Pokedex")
            .onAppear {
                viewModel.fetchPokemons()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

