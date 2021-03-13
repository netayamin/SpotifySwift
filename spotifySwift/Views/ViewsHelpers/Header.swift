//
//  SwiftUIView.swift
//  spotifySwift
//
//  Created by neta yamin on 09/03/2021.
//

import SwiftUI


struct HeaderView: View {
    
    var title: String
    var subtitle: String

    var body: some View {
        HStack(){
            VStack(alignment:.leading){
                Text(title)
                    .font(.system(size: 40, weight: .bold, design: .default))
                Text(subtitle)
                    .font(.callout)
                
            }
            Spacer()
        }.padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

