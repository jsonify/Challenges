//
//  Regiment.swift
//  PushUps
//
//  Created by Jason on 2/6/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct DayViewModel: Codable, Identifiable {
    var id: Int
    var day: Int
    var set: [Sets]
    var isComplete: Bool
    
    struct Sets: Codable {
        var rep: Int
    }
    
}


