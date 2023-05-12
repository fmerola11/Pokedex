//
//  Pokemon.swift
//  Pokedex
//
//  Created by Francesco Merola on 11/05/23.
//

import Foundation

// MARK: - Pokemon

struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}
