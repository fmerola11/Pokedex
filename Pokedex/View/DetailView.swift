//
//  DetailView.swift
//  Pokedex
//
//  Created by Francesco Merola on 12/05/23.
//

import SwiftUI

struct DetailView: View {
    
    let pokemon: Pokemon
    
    @ObservedObject var viewModel: PokemonViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Abilities")
                    .font(.title)
                    .fontWeight(.medium)
                HStack {
                    if viewModel.pokemonAbilities.isEmpty {
                        Text("Loading abilities...")
                            .padding(.trailing, 215)
                    } else {
                        ForEach(viewModel.pokemonAbilities) { ability in
                            Text(ability.ability.name)
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle(pokemon.name.capitalized)
            .onAppear {
                viewModel.fetchPokemonAbilities(pokemon: pokemon) { pokemonAbilities in
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"), viewModel: PokemonViewModel())
    }
}
