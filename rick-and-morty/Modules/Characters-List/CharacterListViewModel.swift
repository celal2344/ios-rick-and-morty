//
//  CharacterListService.swift
//  rick-and-morty
//
//  Created by Celal on 7.10.2024.
//
import Foundation

class CharacterListViewModel {
    static var shared = CharacterListViewModel()
    
    
    func getCharacters(page:Int) async throws -> CharacterListModel {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {throw APIError.invalidURL}
        let (data, _) = try await URLSession.shared.data(from: url)
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            print(page)
            return try decoder.decode( CharacterListModel.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
}
public enum APIError: Error {
    case invalidURL
    case invalidData
}
