//
//  Webview.swift
//  Push-It
//
//  Created by Jason Rueckert on 4/20/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    
//    func makeUIView(context: Context) -> some UIView {
//        <#code#>
//    }
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
