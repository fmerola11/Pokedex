//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Francesco Merola on 20/05/23.
//

import XCTest
@testable import Pokedex

final class PokedexTests: XCTestCase {

    var viewModel: PokemonViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = PokemonViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    
    func testFetchPokemons() {
        let expectation = XCTestExpectation(description: "Fetch Pokemons")
        
        viewModel.fetchPokemons()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertGreaterThan(self.viewModel.pokemons.count, 0, "Failed to fetch Pokemons")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testFilteredPokemons() {
         
           let searchText = "bulbasaur"
           let bulbasaur = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1")
           let ivysaur = Pokemon(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2")
           viewModel.pokemons = [bulbasaur, ivysaur]
           
           let filteredPokemons = viewModel.filteredPokemons(searchText: searchText)
           
           XCTAssertEqual(filteredPokemons.count, 1, "Failed to filter pokemons correctly")
           XCTAssertEqual(filteredPokemons.first?.name, "bulbasaur", "Filtered pokemons contain incorrect pokemon")
       }
    
    func testFetchPokemonDetails() {
    
           let expectation = XCTestExpectation(description: "Fetch Pokemon Details")
           let bulbasaur = Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1")
           
           viewModel.fetchPokemonDetails(pokemon: bulbasaur) { pokemonDetail in
            
               XCTAssertNotNil(pokemonDetail, "Failed to fetch pokemon details")
               expectation.fulfill()
           }
           
           wait(for: [expectation], timeout: 3)
       }
}
