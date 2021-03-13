//
//  File.swift
//  spotifySwift
//
//  Created by neta yamin on 07/03/2021.
//

import Foundation

// MARK: - Album
struct Playlist: Codable {
    let albums: Albums
}

struct Albums: Codable {
    let href: String
    let items: [Album]
    let limit: Int
    let next: String
    let offset: Int
    let total: Int?
}

struct Image: Codable {
    let height: Int
    let url: String
    let width: Int
}

enum ItemType: String, Codable {
    case track = "track"
}
// MARK: - Track
struct Album: Codable, Identifiable {
    let id: String
    let name: String
    let total_tracks: Int?
    let tracks: Tracks?
    let albumType: String?
    let artists: [Artist]
    let href: String?
    let popularity: Int?
    let availableMarkets: [String]?
    let releaseDatePrecision: String?
    let copyrights: [Copyright]?
    let type, uri: String?
    let images: [Image]
    let releaseDate: String?
    let externalUrls: ExternalUrls?
    let externalIDS: ExternalIDS?

    
    enum CodingKeys: String, CodingKey {
        case id, name
        case total_tracks
        case tracks
        case albumType
        case artists, href, popularity
        case availableMarkets
        case releaseDatePrecision
        case copyrights, type, uri, images
        case releaseDate
        case externalUrls
        case externalIDS
    }
}

// MARK: - Image

