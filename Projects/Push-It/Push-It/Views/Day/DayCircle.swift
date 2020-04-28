//
//  DayCircle.swift
//  PushUps
//
//  Created by Jason on 2/13/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct DayCircle: View {
    var day: DayViewModel
    
    var body: some View {
        ZStack {
            if !day.isComplete {
                ButtonCircleView(image: "\(day.day).circle.fill")
            } else {
                ButtonCircleView(image: "clear")
            }
            
        }
    }
}

struct DayCircle_Previews: PreviewProvider {
    static var previews: some View {
        DayCircle(day: dayData[0])
    }
}
