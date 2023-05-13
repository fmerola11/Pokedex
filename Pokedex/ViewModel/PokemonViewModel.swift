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
    
    func fetchPokemons (completion: @escaping([Pokemon]) -> Void) {
        
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
                completion(self.pokemons)
            }
            catch {
                print("Error in decoding data")
            }
        }
        dataTask.resume()
    }
    
    func fetchPokemonAbilities (pokemon: Pokemon, completion: @escaping([Ability]) -> Void) {
        
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
                }
                    
                completion(self.pokemonAbilities)
            } catch {
                print("Error in decoding data for PokemonDetail")
            }
        }
        dataTask.resume()
    }
}
