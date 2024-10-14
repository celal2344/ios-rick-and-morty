//
//  EpisodesListView.swift
//  rick-and-morty
//
//  Created by Celal on 8.10.2024.
//

import SwiftUI

struct EpisodesListView: View {
    var viewModel = EpisodesListViewModel()
    
    @State private var epsList: EpisodesListModel?
    @State private var showError = false
    @State private var errorStr = ""
    var body: some View {
        VStack{
            if let episodes = epsList?.results {
                List(episodes){episode in
                    Text(episode.name)
                }
            }else if epsList == nil{
                
            }else{
                
            }
        }
        .task {
            do{
                epsList = try await viewModel.getEpisodes()
            }catch APIError.invalidData{
                errorStr = "invalid Data"
                showError.toggle()
            }catch APIError.invalidURL{
                errorStr = "invalid url"
                showError.toggle()
            }catch{
                errorStr = "unknown error"
                showError.toggle()
            }
        }
        .alert(errorStr, isPresented: $showError, actions: {})
    }
}

#Preview {
    EpisodesListView()
}
