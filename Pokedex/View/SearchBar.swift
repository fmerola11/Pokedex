//
//  SearchBar.swift
//  Pokedex
//
//  Created by Francesco Merola on 15/05/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text)
                .foregroundColor(.primary)
                .keyboardType(.webSearch)
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
            }
            .foregroundColor(.primary)
            .opacity(text.isEmpty ? 0 : 1)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}
