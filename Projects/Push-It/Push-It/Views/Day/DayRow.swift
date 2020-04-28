//
//  DayRow.swift
//  PushUps
//
//  Created by Jason on 2/12/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct DayRow: View {
    @ObservedObject var userData: UserData
    
    @State private var completeButtonShowing = false
    
    var day: DayViewModel
    var dayIndex: Int {
        userData.days.firstIndex(where: { $0.id == day.id })!
    }
    
    var body: some View {
        let dayId = "Completed-day-\(dayIndex)"
        
        let rep1: String = "\(day.set[0].rep).square.fill"
        let rep2: String = "\(day.set[1].rep).square.fill"
        let rep3: String = "\(day.set[2].rep).square.fill"
        let rep4: String = "\(day.set[3].rep).square.fill"
        
        
        return ZStack {
            Color("background1")
            .edgesIgnoringSafeArea(.all)
            HStack {
                Spacer()
                if !self.completeButtonShowing {
                    ButtonView(image: "\(day.day).circle.fill", rep1: day.day == 30 ? "50.square.fill" : rep1, rep2: day.day == 30 ? "xmark.square.fill" : rep2, rep3: day.day == 30 ? "xmark.square.fill" : rep3, rep4: day.day == 30 ? "xmark.square.fill" : rep4)
                } else {
                    ButtonViewCompleted(image: "\(day.day).circle.fill", title: "Completed")
                        
                }
                Spacer()
            }
        }
        .onAppear {
            self.completeButtonShowing = UserDefaults.standard.bool(forKey: dayId)
        }
    }
}

struct DayRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayRow(userData: UserData(), day: dayData[0])
            DayRow(userData: UserData(), day: dayData[29])                
        }
        .previewLayout(.fixed(width: 300, height: 70))
        .environment(\.colorScheme, .dark)
    }
}
