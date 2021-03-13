//
//  SongBox.swift
//  spotifySwift
//
//  Created by neta yamin on 09/03/2021.
//

import SwiftUI
import URLImage
import Combine
import SwiftUIX

struct SongBox: View {
    
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    var body: some View {
        let url = URL(string: album.images[1].url)!
        
        VStack() {
            URLImage(url: url) { image in
                image
                    .renderingMode(.original)
                    .resizable()
                    .frame(height: Helpers.width/2 - 15)

            }.frame(height: Helpers.width/2 - 30)

            
            Text(album.name)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text(album.artists[0].name)
                .multilineTextAlignment(.center)
                .font(.caption)
            
        }.frame(maxHeight: 200)
        
    }
    
    
}




