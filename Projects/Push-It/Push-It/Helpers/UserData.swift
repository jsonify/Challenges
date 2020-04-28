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
    @Published var showCompletedOnly: Bool = UserDefaults.standard.bool(forKey: "showCompletedOnly") {
        didSet {
            UserDefaults.standard.set(self.showCompletedOnly, forKey: "showCompletedOnly")
        }
    }
    
    @Published var days = dayData
    
    @Published var totalReps: Int = UserDefaults.standard.integer(forKey: "totalReps")
}
