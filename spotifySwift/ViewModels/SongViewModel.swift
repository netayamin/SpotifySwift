//
//  SongViewModel.swift
//  spotifySwift
//
//  Created by neta yamin on 06/03/2021.
//

import Foundation

class AlbumsViewModel : ObservableObject {
    @Published var albums = [Album]()
    @Published var searchText : String = ""
    @Published var activeSearch = false
    
    init() {
        SpotifyAPI.shared.FetchAlbumsList(completion: { [weak self] (result) in
            switch result {
            case .success(let arr) :
                DispatchQueue.main.async {
                    print("collected albums")
                    self?.albums = arr
                }
            case .failure : break
            }
        })
    }
    
}
