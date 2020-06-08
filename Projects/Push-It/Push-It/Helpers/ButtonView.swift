//
//  ButtonView.swift
//  PushUps
//
//  Created by Jason on 2/12/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    var image: String
    var rep1: String
    var rep2: String
    var rep3: String
    var rep4: String
    
    var body: some View {
        HStack() {
            Image(systemName: "\(image)")
                .font(.system(size: 50.0))
                .padding(.leading, -55)
            Spacer()
            HStack {
//                RepSquare(repCount: "\(rep1)")
                Image(systemName: "\(rep1)")
                .font(.system(size: 30.0))
                Image(systemName: "\(rep2)")
                .font(.system(size: 30.0))
                Image(systemName: "\(rep3)")
                .font(.system(size: 30.0))
                Image(systemName: "\(rep4)")
                .font(.system(size: 30.0))
//                Text(upperReps)
            }.padding(.leading, 50)
            
        }
        .frame(width: 200)
        .foregroundColor(Color.primary)
        .padding(EdgeInsets(top: 20, leading: 70, bottom: 20, trailing: 60))
        .background(Capsule().stroke(Color("buttonStroke"), lineWidth: 2))
        .background(Color("background1"))
        .cornerRadius(.infinity)
        .padding(.vertical)
        .shadow(color: Color("buttonShadowLower"), radius: 8, x: 6, y: 6)
        .shadow(color: Color("buttonHighlightUpper"), radius: 8, x: -6, y: -6)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonView(image: "1.circle.fill", rep1: "2.square.fill", rep2: "2.square.fill", rep3: "2.square.fill", rep4: "2.square.fill")
                .environment(\.colorScheme, .dark)
            
            RepSquare(repCount: "100")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

struct RepSquare: View {
    var repCount: String
    
    var body: some View {
        Text("\(repCount)")
            .frame(width: 28, height: 28)
            .foregroundColor(Color("background1"))
            .background(Color.primary)
        .cornerRadius(5)
    }
}

