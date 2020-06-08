//
//  UserData.swift
//  PushUps
//
//  Created by Jason on 2/12/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    static let totalReps = "totalReps"
    static let difficulty = "difficulty"
    static let showCompletedOnly = "showCompletedOnly"
    @Published var days = dayData
    
    @Published var showCompletedOnly: Bool = true {
        didSet {
            UserDefaults.standard.set(showCompletedOnly, forKey: Self.showCompletedOnly)
        }
    }    
    
    @Published var totalReps: Int {
        didSet {
            UserDefaults.standard.set(totalReps, forKey: Self.totalReps)
        }
    }
    
    @Published var difficulty: Int = 0{
        didSet {
            UserDefaults.standard.set(difficulty, forKey: Self.difficulty)
        }
    }
    
    init() {
        totalReps = UserDefaults.standard.integer(forKey: Self.totalReps)
        difficulty = UserDefaults.standard.integer(forKey: Self.difficulty)
    }
    
    func resetAllDayData() {
        let defaults = UserDefaults.standard
        
        for repNumber in 1...4 {
            for dayNumber in 0...29 {
                if defaults.bool(forKey: "rep\(repNumber)-\(dayNumber)") {
                    defaults.removeObject(forKey: "rep\(repNumber)-\(dayNumber)")
                }

                if defaults.bool(forKey: "Completed-day-\(dayNumber)") {
                    defaults.removeObject(forKey: "Completed-day-\(dayNumber)")
                }
                
                if defaults.bool(forKey: "repsToday-\(dayNumber)") {
                    defaults.removeObject(forKey: "repsToday-\(dayNumber)")
                }
            }
        }
        
        if defaults.integer(forKey: "totalReps") > 0 {
            defaults.removeObject(forKey: "totalReps")
        }
    }
    
    func resetOnlyDayData() {
        let defaults = UserDefaults.standard
        
        for repNumber in 1...4 {
            for dayNumber in 0...29 {
                if defaults.bool(forKey: "rep\(repNumber)-\(dayNumber)") {
                    defaults.removeObject(forKey: "rep\(repNumber)-\(dayNumber)")
                }

                if defaults.bool(forKey: "Completed-day-\(dayNumber)") {
                    defaults.removeObject(forKey: "Completed-day-\(dayNumber)")
                }
            }
        }
    }
}
