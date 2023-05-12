//
//  Bho.swift
//  Pokedex
//
//  Created by Francesco Merola on 11/05/23.
//

import Foundation

// MARK: - Response

struct Response: Codable {
    let count: Int
    let next, previous: JSONNull
    let results: [Pokemon]
}

