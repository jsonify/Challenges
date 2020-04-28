//
//  ThanksView.swift
//  Push-It
//
//  Created by Jason Rueckert on 4/20/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ThanksView: View {
    var body: some View {
        ZStack {
            Color("background1")
            .edgesIgnoringSafeArea(.all)
            
            List {
                Text("Alise Rueckert - the love of my life")
                
                NavigationLink(destination: Webview(url: "https://www.twitter.com/twostraws")) {
                    Text("@twoStraws - tutorials, tutorials, tutorials!")
                }
                
                NavigationLink(destination: Webview(url: "https://twitter.com/bigmtnstudio")) {
                    Text("@bigmtnstudio - Mastering SwiftUI Views")
                }
                
                NavigationLink(destination: Webview(url: "https://twitter.com/seanallen_dev")) {
                    Text("@seanallen_dev - The beard of inspiration")
                }
                
                NavigationLink(destination: Webview(url: "https://twitter.com/search?q=%23100DaysOfSwiftUI&src=typeahead_click")) {
                    Text("#100DaysOfSwift Community")
                }
                
            }
        }
    }
}

struct ThanksView_Previews: PreviewProvider {
    static var previews: some View {
        ThanksView()
    }
}
