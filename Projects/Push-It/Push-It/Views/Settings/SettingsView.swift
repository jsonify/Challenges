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
                Toggle(isOn: $userData.showCompletedOnly) {
                    Text("Show Completed Days")
                }
                NavigationLink(destination: AboutView()) {
                    Text("About Push It")
                }
                
                //
                //                    NavigationLink(destination: PurchaseView()) {
                //                        Text("Push-It Pro")
            }
        }
        .navigationBarTitle("Settings")
            
        .accentColor(Color("Accent"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userData: UserData())
    }
}
