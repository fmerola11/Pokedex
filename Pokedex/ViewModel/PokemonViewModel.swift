//
//  ViewModel.swift
//  Pokedex
//
//  Created by Francesco Merola on 11/05/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    
    func fetchPokemons (completion: @escaping ([Pokemon]) -> Void) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=1281&offset=0") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(Response.self, from: jsonData)
                self.pokemons = decodedData.results
                completion(self.pokemons)
            }
            catch {
                print("Error in decoding data")
            }
        }
        dataTask.resume()
    }
    
    func fetchPokemonDetails (pokemon: Pokemon, completion: @escaping (PokemonDetail) -> Void) {
        
        guard let url = URL(string: pokemon.url) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error != nil else { return }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(PokemonDetail.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error in decoding data")
            }
        }
        dataTask.resume()
    }
}
