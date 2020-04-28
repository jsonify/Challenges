//
//  PurchaseView.swift
//  Push-It
//
//  Created by Jason Rueckert on 4/17/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import StoreKit
import SwiftUI

struct PurchaseView: View {
    let ProductID = "com.jasonrueckert.pushit.FullAccess"
    
    var body: some View {
        ZStack {
            Color("background1")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10.0) {
                Text("Purchasing Push-It Pro will unlock all 30 days of the push up regiments that will take your workout to the next level. Just leave a tip and it's yours; no recurring fees. Your contributions are what allow Push-It exist. So, thank you very much.")
                    .padding()
                
                Button(action: {
                    
                }) {
                    Text("Kind Tip of $0.99")
                }
                .padding()
                .frame(width: 100, height: 100)
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("buttonStroke"), lineWidth: 5))
                .background(Color("background1"))
                .cornerRadius(10)
                .shadow(color: Color("buttonShadowLower"), radius: 8, x: 6, y: 6)
                .shadow(color: Color("buttonHighlightUpper"), radius: 8, x: -6, y: -6)
                
                Spacer()
            }
        }
        
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
            .environment(\.colorScheme, .dark)
        
    }
}
