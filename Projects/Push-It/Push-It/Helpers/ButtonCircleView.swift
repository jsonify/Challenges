//
//  ButtonCircleView.swift
//  PushUps
//
//  Created by Jason on 2/13/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ButtonCircleView: View {
    var image: String
    
    var body: some View {
        
        Button(action: {
            print("Delete button tapped!")
        }) {
            Image(systemName: "\(image)")
            .padding(100)
            .background(Color("NeuDarkBG"))
            .clipShape(Circle())
                .font(.largeTitle)
                .foregroundColor(Color("Accent"))
            .cornerRadius(.infinity)
            .padding(.vertical)
            .shadow(color: Color("NeuDarkShadowLower"), radius: 8, x: 6, y: 6)
            .shadow(color: Color("NeuDarkShadowUpper"), radius: 8, x: -6, y: -6)
        }
    }
}

struct ButtonCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCircleView(image: "2.circle.fill")
    }
}
