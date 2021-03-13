//
//  Helper.swift
//  spotifySwift
//
//  Created by neta yamin on 07/03/2021.
//

import Foundation
import SwiftUI

class Helpers {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

struct Constants {
    static let BASE_URI = "https://accounts.spotify.com"
    static var REDIRECT_URI = "https://www.google.com"
    static let CLIENT_ID : String = "9cc23cf4ac864f6ba8694dbeea14a045"
    static let CLIENT_SECRET : String = "8d67789322da4d958f82849ba0c56fa1"
    
    static let base64 = (Constants.CLIENT_ID + ":" + Constants.CLIENT_SECRET).data(using: .utf8)!.base64EncodedString()
}

enum RequestMethod {
    case post
    case get
}

extension Date {
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
}


func createRequest(url: String, method: RequestMethod, bodyElements: URLComponents? ) -> URLRequest {
    
    var request = URLRequest(url: URL(string: url)!)
    
    switch method {
    case .get:
        request.httpMethod = "GET"
    case .post:
        request.httpMethod = "POST"
    }
    
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    
    request.httpBody = bodyElements?.query?.data(using: .utf8)
    
    return request
}

func forTrailingZero(temp: Double) -> String {
    var roundDouble = String(format: "%g", temp)
    var e = roundDouble.replacingOccurrences(of: ".", with: ":")
    return e
}

func taskFrom<T: Decodable>(url: URLRequest, memberType: T.Type, completionHandler: @escaping (Result<T,Error>) -> Void) {
    URLSession.shared.dataTask(with: url) {data, _, error in
        if let error = error {
            completionHandler(.failure(error))
        } else {
            guard let data = data else {
                return
            }

            completionHandler( Result{ try JSONDecoder().decode(T.self, from: data)})
        }
    }.resume()
}
