//
//  EpisodesListViewModel.swift
//  rick-and-morty
//
//  Created by Celal on 8.10.2024.
//
import Foundation

class EpisodesListViewModel {
    static var shared = EpisodesListViewModel()
 
    func getEpisodes() async throws -> EpisodesListModel {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {throw APIError.invalidURL}
        let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode( EpisodesListModel.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
}
