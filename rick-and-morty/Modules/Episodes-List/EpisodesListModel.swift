// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let episodesListModel = try? JSONDecoder().decode(EpisodesListModel.self, from: jsonData)

import Foundation

// MARK: - EpisodesListModel
struct EpisodesListModel: Codable {
    var info: EpisodesInfo
    var results: [EpisodesResult]
}

// MARK: - Info
struct EpisodesInfo: Codable {
    var count, pages: Int
    var next: String
    var prev: JSONNull?
}

// MARK: - Result
struct EpisodesResult: Codable, Identifiable {
    var id: Int
    var name, airDate, episode: String
    var characters: [String]
    var url: String
    var created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

