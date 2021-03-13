

//
//  SpotifyAPI.swift
//  spotifySwift
//
//  Created by neta yamin on 05/03/2021.
//

import Foundation

class SpotifyAPI {
    
    var token : String
    
    public static var shared = SpotifyAPI(token: UserDefaults.standard.value(forKey: "access_token")! as! String)
    
    private init(token: String) {
        self.token = token
    }
    
    
    func FetchAlbumTracks(id: String ,completion: @escaping ( Result<[Track], Error >) -> Void)  {
        let uri = "https://api.spotify.com/v1/albums/\(id)"
        
        var request = createRequest(url: uri, method: .get, bodyElements: nil)
        
        request.setValue( "Bearer " + token , forHTTPHeaderField: "Authorization")
        
        taskFrom(url: request, memberType: Album.self) { (result) in
            switch result {
            case .failure(let err) : print(err)
            case.success(let tracks) : completion( .success(tracks.tracks!.items) )
            }
        }
    }
    
    func FetchAlbumsList(completion: @escaping ( Result<[Album], Error> ) -> Void)  {
        
        let uri = "https://api.spotify.com/v1/browse/new-releases?country=IL&limit=50"
        
        var request = createRequest(url: uri, method: .get, bodyElements: nil)
        
        request.setValue( "Bearer " + token , forHTTPHeaderField: "Authorization")
        
        taskFrom(url: request, memberType: Playlist.self) { (result) in
            switch result {
            case .failure : break
            case .success(let album) :
                completion(.success(album.albums.items))
            }
        }
    }
    
}

