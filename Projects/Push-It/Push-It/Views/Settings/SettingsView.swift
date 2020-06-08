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
    
    @State private var showResetAll = false
    @State private var showResetDaily = false
    @State private var version = ""
    
    
    var body: some View {
        ZStack {
            Color("background1")
                .edgesIgnoringSafeArea(.all)
            
            Form {
                Toggle("", isOn: $userData.showCompletedOnly)
                    .toggleStyle(ColoredToggleStyle(
                        label: "Show Completed Days",
                        onColor: Color("Accent")
                    ))
                
                NavigationLink(destination: AboutView()) {
                    Text("About Push It")
                }
                
                Section(header: Text("Danger Zone!")) {
                    Text("Reset Daily Progress Only")
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .onTapGesture {
                            self.showResetDaily.toggle()
                            self.version = "partial"
                    }
                    
                    Text("Reset All Progress")
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .onTapGesture {
                            self.showResetAll.toggle()
                            self.version = "all"
                    }
                }
        
                .foregroundColor(Color("Accent"))
                
                ZStack {
                    ResetView(showing: self.$showResetDaily, version: version, userData: userData)
                        .scaleEffect(showResetDaily ? 1 : 0.001 , anchor: .center)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    
                    ResetView(showing: self.$showResetAll, version: version, userData: userData)
                        .scaleEffect(showResetAll ? 1 : 0.001 , anchor: .center)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                }
            }
            
            Spacer()
        }
        .navigationBarTitle("Settings", displayMode: .inline)
        .onAppear(perform: {
            UITableView.appearance().separatorStyle = .none
        })
            .accentColor(Color("Accent"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userData: UserData())
            .environment(\.colorScheme, .dark)
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
