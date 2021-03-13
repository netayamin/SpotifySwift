//
//  LoginView.swift
//  spotifySwift
//
//  Created by neta yamin on 05/03/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var showWebpage : Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button("sign in") {
                    showWebpage.toggle()
                }.accentColor(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(5)
            }.padding(5)

        }.sheet(isPresented: $showWebpage, content: {
            WebView()
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 8")
    }
}
