//
//  ContentView.swift
//  spotifySwift
//
//  Created by neta yamin on 05/03/2021.
//

import SwiftUI
import URLImage

struct EntryView: View {
    
    @ObservedObject var auth : AuthManager
    
    var body: some View {
        if (auth.isLoggedIn) {
            TabsView(auth: auth)
        } else {
            LoginView()
        }
    }
}



