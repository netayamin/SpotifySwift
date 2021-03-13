//
//  AuthManager.swift
//  spotifySwift
//
//  Created by neta yamin on 05/03/2021.
//

import Foundation
import SwiftUI



final class AuthManager : ObservableObject {
    
    public static let shared = AuthManager()
    
    private var access_token : String? = UserDefaults.standard.value(forKey: "access_token") as? String
    
    @Published var isLoggedIn =  ((UserDefaults.standard.value(forKey: "access_token"
    ) as? String) != nil) ? true : false
    
    private init() {
        shouldRefresh()
    }
    
    @Published public var isUpdatingToken = false
    
    public var signInURL : String  {
        return"\(Constants.BASE_URI)/authorize?client_id=\(Constants.CLIENT_ID)&response_type=code&redirect_uri=\(Constants.REDIRECT_URI.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)&callback&scope=user-read-private%20user-read-email"
    }
    
    private func cacheToken(res: AuthResponse) {
        UserDefaults.standard.setValue(res.accessToken, forKey: "access_token")
        UserDefaults.standard.setValue(res.refreshToken, forKey: "refresh_token")
        UserDefaults.standard.setValue( NSDate.now.adding(minutes: 60), forKey: "expire")
        DispatchQueue.main.async {
            self.isLoggedIn = true
        }
    }
    
    private func updateToken(res: AuthResponse) {
        UserDefaults.standard.setValue(res.accessToken, forKey: "access_token")
        UserDefaults.standard.setValue( NSDate.now.adding(minutes: 60), forKey: "expire")
        DispatchQueue.main.async {
            self.isUpdatingToken = false
        }
    }
    
    private func shouldRefresh() {
        guard let expireTime = UserDefaults.standard.value(forKey: "expire") as? Date else {
            return
        }
        
        if( expireTime.timeIntervalSinceNow / 60 < 10 ) {
            print("Time to refresh")
            self.isUpdatingToken = true
            refreshToken()
        } else {
            print("It's not time to refresh")
        }
    }
    
    private func refreshToken() {
        let refresh_token = UserDefaults.standard.value(forKey: "refresh_token") as! String

        let url =  "\(Constants.BASE_URI)/api/token"
        
        var body = URLComponents()
        
        body.queryItems = [
            URLQueryItem(name: "grant_type",
                         value: "refresh_token"),
            URLQueryItem(name: "refresh_token",
                         value: refresh_token),
        ]
        
        var request = createRequest(url: url, method: .post, bodyElements: body)
        
        request.setValue( "Basic " + Constants.base64 , forHTTPHeaderField: "Authorization")

        taskFrom(url: request, memberType: AuthResponse.self) { [weak self] (result) in
            switch result {
            case .failure(let err) : print(err)
            case .success(let res) :
                self?.updateToken(res: res)
            }
        }
    }
    
    
    public func exchangeCodeWithToken(code: String) {
        let uri = "\(Constants.BASE_URI)/api/token/"
        
        var body = URLComponents()
        
        body.queryItems = [
            URLQueryItem(name: "grant_type",
                         value: "authorization_code"),
            
            URLQueryItem(name: "code",
                         value: code),
            
            URLQueryItem(name: "redirect_uri", value: Constants.REDIRECT_URI),
        ]
        
        var request = createRequest(url: uri, method: .post, bodyElements: body)
        
        request.setValue( "Basic " + Constants.base64 , forHTTPHeaderField: "Authorization")

        taskFrom(url: request, memberType: AuthResponse.self) { [weak self] (result) in
            switch result {
            case .failure : break
            case .success(let res) :
                self?.cacheToken(res: res)
            }
        }
    }
}



