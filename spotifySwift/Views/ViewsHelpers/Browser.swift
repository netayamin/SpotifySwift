//
//  WebViewController.swift
//  spotifySwift
//
//  Created by neta yamin on 05/03/2021.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    //MARK The first call is the service ‘/authorize’ endpoint,
    let request: URLRequest = URLRequest(url: URL(string: AuthManager.shared.signInURL)!)
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.navigationDelegate = context.coordinator
        
        uiView.uiDelegate = context.coordinator
        
        uiView.load(request)
    }
    
    func makeCoordinator() -> coordinator {
        return coordinator()
    }
    
}

class coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
    
    //MARK try to catch the Code when recieving redirect request
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
        guard let url = webView.url else {
            return
        }

        let comp = URLComponents(string: url.absoluteString)
        
        guard let code = comp?.queryItems?.first(where: { $0.name == "code" })?.value else {
            return
        }
        
        //MARK passing the code to get the token
        AuthManager.shared.exchangeCodeWithToken(code: code) 
        
    }
    
}

