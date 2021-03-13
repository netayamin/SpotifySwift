//
//  SongView.swift
//  spotifySwift
//
//  Created by neta yamin on 06/03/2021.
//

import SwiftUI
import URLImage

struct TabsView : View{
    
    @ObservedObject var auth : AuthManager
    
    init(auth: AuthManager) {
        self.auth = auth
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        if auth.isUpdatingToken == true {
        } else {
            TabView {
                AlbumsView()
                    .tabItem {
                        VStack{
                            SwiftUI.Image(systemName: "music.note.list")
                            Text("Albums")
                        }
                    }
                Color.red
                .edgesIgnoringSafeArea(.all)
                .tabItem{
                    SwiftUI.Image(systemName: "gear")
                    Text("Settings")
                }
            }.accentColor(.green)
        }
        
    }
}


