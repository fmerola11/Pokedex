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
    
    @State private var imageURL: URL?
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 10) {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                Text("Abilities")
                    .font(.title)
                    .fontWeight(.medium)
                HStack {
                    if viewModel.pokemonAbilities.isEmpty {
                        Text("Loading abilities...")
                    } else {
                        ForEach(viewModel.pokemonAbilities) { pokemonAbility in
                            Text(pokemonAbility.ability.name)
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle(pokemon.name.capitalized)
            .onAppear {
                viewModel.fetchPokemonAbilities(pokemon: pokemon) { pokemonDetail in
                    
                    self.imageURL = viewModel.fetchPokemonImageUrl(pokemonDetail: pokemonDetail)
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
