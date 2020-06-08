//
//  DayList.swift
//  PushUps
//
//  Created by Jason on 2/12/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct DayList: View {
    @ObservedObject var userData = UserData()
    @State private var showingDay = false
    @State private var totalReps = 0
    @State private var showingSettingsView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background1")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        ForEach(userData.days) { singleDay in
                            if self.userData.showCompletedOnly || !singleDay.isComplete {
                                NavigationLink(destination: DayDetail(userData: self.userData, day: singleDay)) {
                                    DayRow(userData: self.userData, day: singleDay)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 60)
                
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1960784314, blue: 0.3294117647, alpha: 1)))
                            .frame(width: screen.width, height: 100)
                        HStack {
                            Text("Total Push-ups so far:")
                                .foregroundColor(.black)
                            Text("\(self.totalReps)")
                                .foregroundColor(.white)
                                .font(.largeTitle).bold()
                            
                        }
                        .frame(width: screen.width, height: 100)
                    }
                    .offset(y: screen.height - 100)
                    .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
            }
            .onAppear {
                self.totalReps = UserDefaults.standard.integer(forKey: "totalReps")
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)

            }
            .navigationBarTitle("Push It!")
            .navigationBarItems(trailing:
                NavigationLink(destination: SettingsView(userData: userData)) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .padding(5)
                }
            )
        } 
        .accentColor(Color("Accent"))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DayList_Previews: PreviewProvider {
    static var previews: some View {
        DayList()
            .environment(\.colorScheme, .dark)
        
    }
}
