//
//  SettingsView.swift
//  PushUps-Tabs
//
//  Created by Jason on 2/11/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("background1")
                .edgesIgnoringSafeArea(.all)
            
            List {
                Toggle("", isOn: $userData.showCompletedOnly)
                    .toggleStyle(ColoredToggleStyle(
                        label: "Show Completed Days",
                        onColor: Color("Accent")
                    ))
                
                NavigationLink(destination: AboutView()) {
                    Text("About Push It")
                }
                
                //
                //                    NavigationLink(destination: PurchaseView()) {
                //                        Text("Push-It Pro")
            }
        }
        .navigationBarTitle("Settings", displayMode: .inline)
            
        .accentColor(Color("Accent"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userData: UserData())
    }
}

struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: { configuration.isOn.toggle() } ) {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.2))
                    .onTapGesture { configuration.isOn.toggle() }
            }
        }
//        .font(.title)
//        .padding(.horizontal)
    }
}
