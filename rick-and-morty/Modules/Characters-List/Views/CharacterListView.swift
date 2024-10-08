//
//  CharacterListView.swift
//  rick-and-morty
//
//  Created by Celal on 7.10.2024.
//

import SwiftUI

struct CharacterListView: View {
    var viewModel = CharacterListViewModel.shared
    
    @State private var charList: CharacterListModel?
    @State private var showError = false
    var body: some View {
        NavigationView {
            VStack{
                Text("Characters")
                if let characters = charList?.results {
                    List(characters) { character in
                        CharacterView(character: character)
                    }
                } else if charList == nil {
                    Text("No data available.")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    ProgressView("Loading...")
                }
            }
        }
        .navigationTitle("Items")
        .task{
            do{
                charList = try await viewModel.getCharacters()
            }catch{
                showError.toggle()
            }
        }
        .alert("Failed to fetch data", isPresented: $showError, actions: {})
    }
}
#Preview {
    CharacterListView()
}
