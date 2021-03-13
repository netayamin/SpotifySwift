// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let track = try? newJSONDecoder().decode(Track.self, from: jsonData)

import Foundation


// MARK: - Copyright
struct Copyright: Codable {
    let type, text: String
}

// MARK: - ExternalIDS
struct ExternalIDS: Codable {
    let upc: String
}


// MARK: - Tracks
struct Tracks: Codable {
    let offset: Int
    let next: JSONNull?
    let href: String
    let limit: Int
    let previous: JSONNull?
    let total: Int
    let items: [Track]
}

// MARK: - Item
struct Track: Codable {
    let id: String
    let discNumber, trackNumber: Int?
    let uri: String
    let artists: [Artist]
    let href: String
    let isLocal: Bool?
    let availableMarkets: [String]?
    let type: ItemType?
    let explicit: Bool?
    let preview_url: String?
    var duration_ms: Double

    let externalUrls: ExternalUrls?
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case discNumber
        case trackNumber
        case uri, artists, href
        case isLocal
        case availableMarkets
        case type, explicit
        case preview_url
        case duration_ms
        case externalUrls
        case name
    }
}



// MARK: - Encode/decode helpers

class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
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

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}
