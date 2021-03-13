// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let album = try? newJSONDecoder().decode(Album.self, from: jsonData)

import Foundation


// MARK: - Artist
struct Artist: Codable {
    let externalUrls: ExternalUrls?
    let href: String?
    let id, name, type, uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls
        case href, id, name, type, uri
    }
}

// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    let spotify: String?
}







