//
//  AboutView.swift
//  Push-It
//
//  Created by Jason Rueckert on 4/20/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import StoreKit
import SwiftUI

struct AboutView: View {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        ZStack {
            Color("background1")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("buttonStroke"), lineWidth: 5))
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading) {
                        Text("Push It \(self.appVersion!)")
                            .bold()
                        Text("by Jason Rueckert")
                    }
                    .padding(.leading, 20)
                }
                
                List {
                    Button(action: {
                        SKStoreReviewController.requestReview()
                    }) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20))
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .background(Color("Accent"))
                                .cornerRadius(5)
                            
                            Text("Rate Push It")
                        }
                    }
                    
                    HStack {
                        Image("twitter-logo")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .colorInvert()
                            .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                            .cornerRadius(5)
                        NavigationLink(destination: Webview(url: "https://www.twitter.com/jsonify")) {
                            Text("@jsonify")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "eye.fill")
                        .font(.system(size: 18))
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)))
                        .cornerRadius(5)
                        NavigationLink(destination: Webview(url: "https://jasonrueckert.com/push-it-privacy")) {
                            Text("Privacy Policy")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "globe")
                        .font(.system(size: 20))
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                        .cornerRadius(5)
                        NavigationLink(destination: Webview(url: "https://jasonrueckert.com/")) {
                            Text("Developer Website")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "smiley.fill")
                            .font(.system(size: 20))
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(5)
                        NavigationLink(destination: ThanksView()) {
                            Text("Thanks To")
                        }
                    }
            
//                    
//                    HStack {
//                        Image(systemName: "star.fill")
//                            .font(.system(size: 20))
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(.white)
//                            .background(Color.orange)
//                            .cornerRadius(5)
//                        NavigationLink(destination: Text("Coming Soon")) {
//                            Text("Feature Requests")
//                        }
//                        .disabled(true)
//                    }
                }
            }
            .padding(.top, 20)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
        .environment(\.colorScheme, .dark)
    }
}
