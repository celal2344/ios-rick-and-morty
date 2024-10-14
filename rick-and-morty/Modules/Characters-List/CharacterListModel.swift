// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterListModel = try? JSONDecoder().decode(CharacterListModel.self, from: jsonData)

import Foundation

// MARK: - CharacterListModel
struct CharacterListModel: Codable {
    var info: CharacterInfo
    var results: [CharacterResult]
}

// MARK: - Info
struct CharacterInfo: Codable {
    var count, pages: Int
    var next: String
    var prev: String?
}

// MARK: - Result
struct CharacterResult: Codable, Identifiable {
    var id: Int
    var name, status, species, type: String
    var gender: String
    var origin, location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

// MARK: - Location
struct Location: Codable {
    var name: String
    var url: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }
    
    func hash(into hasher: inout Hasher) {
        return 
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
