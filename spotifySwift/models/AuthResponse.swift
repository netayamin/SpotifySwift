//
//  AuthResponse.swift
//  spotifySwift
//
//  Created by neta yamin on 05/03/2021.
//

import Foundation


struct AuthResponse: Codable {
    let accessToken, tokenType, scope: String
    let expiresIn: Int 
    let refreshToken: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
    }
}
