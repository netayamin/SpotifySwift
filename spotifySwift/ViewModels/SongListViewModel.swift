//
//  SongListViewModel.swift
//  spotifySwift
//
//  Created by neta yamin on 09/03/2021.
//

import Foundation

class SongsListViewModel: ObservableObject {
    @Published var tracks = [Track]()
    
    var id : String
    
    init(id: String) {
        self.id = id
        
        SpotifyAPI.shared.FetchAlbumTracks(id: id) { (result) in
            switch result {
            case .failure(let err) : print(err)
            case .success(let tracks) :
                
                self.tracks = tracks
                
                for index in 0..<tracks.count {
                    let x = tracks[index].duration_ms/60000
                    let num = (x*100).rounded()/100
                    self.tracks[index].duration_ms = num
                }
            }
        }
    }
}
