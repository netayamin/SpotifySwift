//
//  TrackPlayerView.swift
//  spotifySwift
//
//  Created by neta yamin on 08/03/2021.
//

import Foundation
import SwiftUI
import URLImage

struct TrackPlayerView: View {
    private var track: Track
    private var image : String
    @State private var rotation = false
    
    init(track: Track, album :Album) {
        self.track = track
        self.image = album.images[0].url
    }
    
    var body: some View{
        VStack(spacing: 30) {
            Spacer()
            CasetaView(image: image)
                .rotationEffect(.degrees(rotation ? 360 : 0))
                .transition(.identity)
                .onAppear(perform: {
                    withAnimation(Animation.linear(duration: 7).repeatForever(autoreverses: false)) {
                        rotation = true
                    }
                  
                })
            VStack{
                Text(track.name).font(.title)
                Text(track.artists[0].name)
            }
            buttonsBar()
                .padding(.top, 20)
            Spacer()
        }.frame(maxWidth: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}



struct buttonsBar: View {
    var body: some View {
        HStack() {
            
            SwiftUI.Image(systemName: "backward.fill")
                .resizable()
                .frame(width: 20, height: 20)
            Spacer()
            
            SwiftUI.Image(systemName: "gobackward.10")
                .resizable()
                .frame(width: 20, height: 20)
            Spacer()
            
            SwiftUI.Image(systemName: "play")
                .padding(20)
                .background(.green)
                .cornerRadius(5)
            Spacer()
            
            SwiftUI.Image(systemName: "goforward.10")
                .resizable()
                .frame(width: 20, height: 20)
            
            Spacer()
            
            SwiftUI.Image(systemName: "forward.fill")
                .resizable()
                .frame(width: 20, height: 20)
            
            
        }.padding(.horizontal, 20)
    }
}

struct CasetaView: View {
    
    var image: String
    
    var body: some View {
        URLImage(url: URL(string: image)!) { image in
            image
                .resizable()
                .mask(Circle())
                .scaledToFill()
                .frame(width: Helpers.width - 100, height: Helpers.width - 100)
                .overlay(
                    Circle()
                        .fill(Color.black)
                        .frame(width: Helpers.width - 300))
        }.frame(width: Helpers.width - 100, height: Helpers.width - 100)
        
        
    }
}
