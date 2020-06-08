//
//  ResetDailyView.swift
//  Push-It
//
//  Created by Jason Rueckert on 6/7/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ResetDailyView: View {
    @Binding var showing: Bool
    
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Text("Are you sure?")
                        .font(.system(size: 24))
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .background(Color("Accent"))
                        .foregroundColor(.white)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showing = false
                            
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .offset(y: -10)
                    }
                }
                Spacer()
                
                VStack {
                    Text("Pressing that reset button will reset the daily progress, but keep the total number of push-ups completed")
                        .font(.subheadline)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        Button(action: {
                                self.userData.resetOnlyDayData()
                        }) {
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.system(size: 20.0))
                                Text("Reset Progress")
                            }
                            .foregroundColor(.white)
                        }
                        .frame(width: 200, height: 30)
                        .foregroundColor(Color.primary)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color("buttonStroke"), lineWidth: 2))
                        .background(Color("Accent"))
                        .cornerRadius( 30)
                        .padding(.vertical)
                        .shadow(color: Color("buttonShadowLower"), radius: 8, x: 6, y: 6)
                        .shadow(color: Color("buttonHighlightUpper"), radius: 8, x: -6, y: -6)
                    }
                }
                .offset(y: -30)
                
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 290)
            .background(Color("background1"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
        }
    }
}

struct ResetDailyView_Previews: PreviewProvider {
    static var previews: some View {
        ResetDailyView(showing: .constant(true), userData: UserData())
        .environment(\.colorScheme, .dark)
    }
}
