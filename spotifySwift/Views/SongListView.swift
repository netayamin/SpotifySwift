//
//  SongInfo.swift
//  spotifySwift
//
//  Created by neta yamin on 07/03/2021.
//

import Foundation
import SwiftUI

struct SongsListView: View {
    
    var album : Album
    @ObservedObject var model : SongsListViewModel
    
    init(album: Album) {
        self.album = album
        model = SongsListViewModel(id: album.id)
    }
    
    var body: some View {
        
        ScrollView {
            ForEach(model.tracks, id: \.id) { track in
                NavigationLink(destination: TrackPlayerView(track: track, album: album) ){
                    HStack {
                        Text(track.name)
                        Spacer()
                        Text(forTrailingZero(temp: track.duration_ms))
                        Divider()
                    }.padding(20)
                }
            }
        }.background(Color.black)
        .foregroundColor(.white)
        .navigationBarTitle(album.name)
    }
    
}



