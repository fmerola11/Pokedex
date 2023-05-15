//
//  ViewModel.swift
//  Pokedex
//
//  Created by Francesco Merola on 11/05/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    @Published var pokemonAbilities: [Ability] = []
    @Published var pokemonMoves: [Move] = []
    @Published var pokemonHeight: Int = 0
    @Published var pokemonWeight: Int = 0
    
    func fetchPokemons () {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=1281&offset=0") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(Response.self, from: jsonData)
                DispatchQueue.main.async {
                    self.pokemons = decodedData.results
                }
            }
            catch {
                print("Error in decoding data")
            }
        }
        dataTask.resume()
    }
    
    func filteredPokemons(searchText: String) -> [Pokemon] {
           if searchText.isEmpty {
               return pokemons
           } else {
               return pokemons.filter { pokemon in
                   pokemon.name.localizedCaseInsensitiveContains(searchText)
               }
           }
       }
    
    func fetchPokemonDetails (pokemon: Pokemon, completion: @escaping(PokemonDetail) -> Void) {
        
        guard let url = URL(string: pokemon.url) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(PokemonDetail.self, from: jsonData)
                
                DispatchQueue.main.async {
                    self.pokemonAbilities = decodedData.abilities
                    self.pokemonMoves = decodedData.moves
                    self.pokemonHeight = decodedData.height
                    self.pokemonWeight = decodedData.weight
                }
                completion(decodedData)
            } catch {
                print("Error in decoding data for PokemonDetail")
            }
        }
        dataTask.resume()
    }
    
    func fetchPokemonImageUrl (pokemonDetail: PokemonDetail) -> URL {
        
        let url = pokemonDetail.sprites.other?.officialArtwork.frontDefault ?? ""
        
        return URL(string: url)!
    }
}
