//
//  RepButtonView.swift
//  Push-It
//
//  Created by Jason Rueckert on 4/17/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct RepButtonView: View {
    var backgroundColor: Color
    var image: String
    var height: CGFloat? = nil
    var radius: CGFloat? = .infinity
    
    var body: some View {
        Image(systemName: "\(image)")
            .font(.system(size: 50.0))
            .frame(width: 200, height: height)
            .foregroundColor(Color.primary)
            .padding(EdgeInsets(top: 20, leading: 70, bottom: 20, trailing: 70))
            .background(RoundedRectangle(cornerRadius: radius ?? 30, style: .continuous).stroke(Color("buttonStroke"), lineWidth: 2))
            .background(backgroundColor)
            .cornerRadius(radius ?? 30)
            .padding(.vertical)
            .shadow(color: Color("buttonShadowLower"), radius: 8, x: 6, y: 6)
            .shadow(color: Color("buttonHighlightUpper"), radius: 8, x: -6, y: -6)
    }
}

struct RepButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RepButtonView(backgroundColor: Color(.green), image: "checkmark.seal.fill", height: 200, radius: 30)
    }
}
