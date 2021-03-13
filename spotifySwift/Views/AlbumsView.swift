//
//  SongsView.swift
//  spotifySwift
//
//  Created by neta yamin on 06/03/2021.
//

import SwiftUI
import URLImage
import SwiftUIX

struct AlbumsView: View {
    
    @ObservedObject var model = AlbumsViewModel()
    @State var searchText : String = ""
    
    var body: some View {
        let filteredAlbums = model.albums.filter { album in
            if searchText.isEmpty { return true }
            return album.name.contains(searchText)
        }
        
        NavigationView {
            VStack(spacing:20){
                Header(searchText: $searchText)
                CollectionView(filteredAlbums, id: \.id) { album in
                    NavigationLink(
                        destination: SongsListView(album: album),
                        label: {
                            SongBox(album: album)
                                .frame(width: Helpers.width/2 - 15)
                                .foregroundColor(.white)
                        })
                        .navigationBarTitle("title", displayMode: .inline)
                }
            }.padding(.horizontal,5)
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Albums", displayMode: .inline)
            .accentColor(.white)
        }
        
        
    }
}

struct Header: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        VStack(spacing: 20){
            HStack{
                Group{
                    Text("Albums").bold()
                        .padding(.trailing, 10)
                    Text("Music").bold()
                        .opacity(0.5)
                    Spacer()
                }.font(.system(.largeTitle))
            }
            
            HStack{
                Group{
                    Text("Playlist").bold()
                    Text("Artists").bold()
                    Text("Albums").bold()
                    Spacer()
                }.padding(.trailing, 10)
            }
            
            HStack{
                RoundedRectangle(cornerRadius: 2.5, style: .circular)
                    .fill(Color.green)
                    .offset( y: -10)
                    .frame(width: 50 ,height: 3)
                Spacer()
            }
            
            
            HStack{
                SearchBar(searchText: $searchText)
            }
            
        }.padding(.bottom, 10)
        .foregroundColor(.white)
    }
}

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if searchText.isEmpty {
                Text("Find new albums")
                    .bold()
                    .foregroundColor(Color.white.opacity(0.3))
            }
            TextField("", text: $searchText)
        }
        .padding(15)
        .background(Color.white.opacity(0.15))
        .cornerRadius(5)

    }
}


struct EntryView_Preview: PreviewProvider {
    static var previews: some View {
        EntryView(auth: AuthManager.shared)
    }
}
