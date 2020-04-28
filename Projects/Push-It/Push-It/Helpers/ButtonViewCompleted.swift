//
//  ButtonViewCompleted.swift
//  PushUps
//
//  Created by Jason on 2/13/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ButtonViewCompleted: View {
    var image: String
        
        var title: String
        
        var body: some View {
            HStack() {
                Image(systemName: "\(image)")
                    .font(.system(size: 56.0))
                    .padding(.leading, -55)
                Spacer()
                VStack {
                    Text(title)
                    
                }.padding(.trailing, 50)
                
            }
            .frame(width: 200)
            .padding(EdgeInsets(top: 12, leading: 60, bottom: 12, trailing: 60))
            .foregroundColor(Color("background1"))
            .background(Color("Accent"))
            .cornerRadius(.infinity)
            .padding(.vertical)
            .shadow(color: Color("buttonShadowLower"), radius: 8, x: 6, y: 6)
            .shadow(color: Color("buttonHighlightUpper"), radius: 8, x: -6, y: -6)
        }
}

struct ButtonViewCompleted_Previews: PreviewProvider {
    static var previews: some View {
        ButtonViewCompleted(image: "1.circle.fill", title: "Completed")
    }
}
