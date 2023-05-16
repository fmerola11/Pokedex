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
            ZStack {
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack (spacing: 10) {
                    VStack {
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
                                    Text(pokemonAbility.ability.name.capitalized)
                                }
                            }
                        }
                    }
                    VStack (spacing: 5) {
                        Text("Moves")
                            .font(.title)
                            .fontWeight(.medium)
                        HStack {
                            if viewModel.pokemonMoves.isEmpty {
                                Text("Loading moves...")
                            } else {
                                ForEach(viewModel.pokemonMoves.prefix(4)) { pokemonMove in
                                    Text(pokemonMove.move.name.capitalized)
                                }
                            }
                        }
                    }
                    VStack (spacing: 5) {
                        Text("Height")
                            .font(.title)
                            .fontWeight(.medium)
                        if viewModel.pokemonHeight == 0 {
                            Text("Loading height...")
                        } else {
                            Text("\(viewModel.pokemonHeight) cm")
                        }
                    }
                    VStack (spacing: 5) {
                        Text("Weight")
                            .font(.title)
                            .fontWeight(.medium)
                        if viewModel.pokemonHeight == 0 {
                            Text("Loading weight...")
                        } else {
                            Text("\(viewModel.pokemonWeight) kg")
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle(pokemon.name.capitalized)
            .onAppear {
                viewModel.fetchPokemonDetails(pokemon: pokemon) { pokemonDetail in
                    self.imageURL = 
                    viewModel.fetchPokemonImageUrl(pokemonDetail: pokemonDetail)
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
