//
//  DayDetail.swift
//  PushUps
//
//  Created by Jason on 2/12/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct DayDetail: View {
    @ObservedObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingCompletedAlert = false
    @State private var completionTitle = ""
    @State private var completionMessage = ""
    
    @State private var button1Clicked = false
    @State private var button2Clicked = false
    @State private var button3Clicked = false
    @State private var button4Clicked = false
    
    @State private var addReps = 0
    
    @State private var repsRemainingToday = 0
    
    
    var day: DayViewModel
    var dayIndex: Int {
        userData.days.firstIndex(where: { $0.id == day.id })!
    }
    
    
    var dayComplete: Bool {
        var complete = false
        if (button1Clicked && button2Clicked && button3Clicked && button4Clicked) {
            complete = true
        }
        return complete
    }
    
    var body: some View {
        let rep1Id = "rep1-\(dayIndex)"
        let rep2Id = "rep2-\(dayIndex)"
        let rep3Id = "rep3-\(dayIndex)"
        let rep4Id = "rep4-\(dayIndex)"
        let repsTodayId = "repsToday-\(dayIndex)"
        
        return ZStack {
            Color("background1")
                .edgesIgnoringSafeArea(.top)
            VStack {
                Text("Push Up Reps")
                    .font(.largeTitle)
                    .bold()
                HStack(spacing: 10.0) {
                    Image("down")
                        .resizable()
                        .scaledToFit()
                    Image("up")
                        .resizable()
                        .scaledToFit()
                }
                .padding(.horizontal)
                
                VStack {
                    if self.day.day < 30 {
                        // MARK:- Day 1 to 29
                        // MARK:- Button 1
                        RepButtonView(backgroundColor: self.button1Clicked ? Color("Accent") : Color("background1"), image: self.button1Clicked ? "checkmark.seal.fill" : "\(self.day.set[0].rep).circle.fill")
                            .onTapGesture {
                                self.button1Clicked.toggle()
                                UserDefaults.standard.set(self.button1Clicked, forKey: rep1Id)
                                if self.button1Clicked == true {
                                    self.addReps += self.day.set[0].rep
                                    self.repsRemainingToday -= self.day.set[0].rep
                                } else {
                                    self.addReps -= self.day.set[0].rep
                                    self.repsRemainingToday += self.day.set[0].rep
                                }
                                self.completed()
                        }
                        
                        // MARK:- Button 2
                        RepButtonView(backgroundColor: self.button2Clicked ? Color("Accent") : Color("background1"), image: self.button2Clicked ? "checkmark.seal.fill" : "\(self.day.set[1].rep).circle.fill")
                            .onTapGesture {
                                self.button2Clicked.toggle()
                                UserDefaults.standard.set(self.button2Clicked, forKey: rep2Id)
                                if self.button2Clicked == true {
                                    self.addReps += self.day.set[1].rep
                                    self.repsRemainingToday -= self.day.set[1].rep
                                } else {
                                    self.addReps -= self.day.set[1].rep
                                    self.repsRemainingToday += self.day.set[1].rep
                                }
                                self.completed()
                        }
                        
                        // MARK:- Button 3
                        RepButtonView(backgroundColor: self.button3Clicked ? Color("Accent") : Color("background1"), image: self.button3Clicked ? "checkmark.seal.fill" : "\(self.day.set[2].rep).circle.fill")
                            .onTapGesture {
                                self.button3Clicked.toggle()
                                UserDefaults.standard.set(self.button3Clicked, forKey: rep3Id)
                                if self.button3Clicked == true {
                                    self.addReps += self.day.set[2].rep
                                    self.repsRemainingToday -= self.day.set[2].rep
                                } else {
                                    self.addReps -= self.day.set[2].rep
                                    self.repsRemainingToday += self.day.set[2].rep
                                }
                                self.completed()
                        }
                        
                        // MARK:- Button 4
                        RepButtonView(backgroundColor: self.button4Clicked ? Color("Accent") : Color("background1"), image: self.button4Clicked ? "checkmark.seal.fill" : "\(self.day.set[3].rep).circle.fill")
                            .onTapGesture {
                                self.button4Clicked.toggle()
                                UserDefaults.standard.set(self.button4Clicked, forKey: rep4Id)
                                if self.button4Clicked == true {
                                    self.addReps += self.day.set[3].rep
                                    self.repsRemainingToday -= self.day.set[3].rep
                                } else {
                                    self.addReps -= self.day.set[3].rep
                                    self.repsRemainingToday += self.day.set[3].rep
                                }
                                self.completed()
                        }
                    } else {
                        // MARK:- Day 30 Button
                        RepButtonView(backgroundColor: self.button1Clicked ? Color("Accent") : Color("background1"), image: self.button1Clicked ? "checkmark.seal.fill" : "\(self.day.set[0].rep).circle.fill", height: 200, radius: 30)
                            .onTapGesture {
                                self.button1Clicked.toggle()
                                UserDefaults.standard.set(self.button1Clicked, forKey: rep1Id)
                                if self.button1Clicked == true {
                                    self.addReps += self.day.set[0].rep
                                    self.repsRemainingToday -= self.day.set[0].rep
                                } else {
                                    self.addReps -= self.day.set[0].rep
                                    self.repsRemainingToday += self.day.set[0].rep
                                }
                                self.completed()
                        }
                    }
                }
                .padding(.bottom, 50)
            }
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1960784314, blue: 0.3294117647, alpha: 1)))
                        .frame(width: screen.width, height: 100)
                    HStack {
                        Text("Push-ups remaining today:")
                            .foregroundColor(.black)
                        Text("\(self.repsRemainingToday)")
                            .foregroundColor(.white)
                            .font(.largeTitle).bold()
                        
                    }
                    .frame(width: screen.width, height: 100)
                }
                .offset(y: screen.height - 100)
                .edgesIgnoringSafeArea(.all)
                Spacer()
            }
            .onAppear {
                self.button1Clicked = UserDefaults.standard.bool(forKey: rep1Id)
                self.button2Clicked = UserDefaults.standard.bool(forKey: rep2Id)
                self.button3Clicked = UserDefaults.standard.bool(forKey: rep3Id)
                self.button4Clicked = UserDefaults.standard.bool(forKey: rep4Id)
                
                self.addReps = UserDefaults.standard.integer(forKey: "totalReps")
                
//                self.repsRemainingToday = repsRemaining
                if !self.button1Clicked {
                    self.repsRemainingToday += self.day.set[0].rep
                }
                
                if !self.button2Clicked {
                    self.repsRemainingToday += self.day.set[1].rep
                }
                
                if !self.button3Clicked {
                    self.repsRemainingToday += self.day.set[2].rep
                }
                
                if !self.button4Clicked {
                    self.repsRemainingToday += self.day.set[3].rep
                }
                UserDefaults.standard.set(self.repsRemainingToday, forKey: repsTodayId)
//                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)
            }
            
        }
        .navigationBarTitle(Text("Day \(day.day)"), displayMode: .inline)
            .alert(isPresented: $showingCompletedAlert) {
                Alert(title: Text(completionTitle), message: Text(completionMessage), dismissButton: .default(Text("Continue")){
                    self.userData.days[self.dayIndex].isComplete.toggle()
                    
                    self.presentationMode.wrappedValue.dismiss()
                    })
        }
    }
    
    func completed() {
        self.simpleSuccess()
        if (dayComplete) {
            self.completionTitle = "Congrats!"
            self.completionMessage = "You did it! You finished the day."
            self.showingCompletedAlert = true
            UserDefaults.standard.set(true, forKey: "Completed-day-\(dayIndex)")
            UserDefaults.standard.set(self.addReps, forKey: "totalReps")
        } else {
            UserDefaults.standard.set(false, forKey: "Completed-day-\(dayIndex)")
            UserDefaults.standard.set(self.addReps, forKey: "totalReps")
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
}

struct DayDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayDetail(userData: UserData(), day: dayData[0])
            DayDetail(userData: UserData(), day: dayData[29])
        }
        .environment(\.colorScheme, .dark)
    }
}
