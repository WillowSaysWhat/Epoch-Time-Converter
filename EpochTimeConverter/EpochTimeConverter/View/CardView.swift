//
//  CardView.swift
//  Your Local Time
//
//  Created by Huw Williams on 02/07/2025.
//

import SwiftUI

struct CardView: View {
    var card: Card = cards[0]
    
    // @Binding var screenSize: CGSize
    @State var isTapped: Bool = false
    @State var isActive: Bool = false
    @State var time = Date.now
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: isTapped ? 0 : 20)
                .fill(card.color.gradient)
                .frame(width: isTapped ? 393 : 360, height: isTapped ? 600 : 500)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .blendMode(.softLight)
                        
                )
                .cornerRadius(isTapped ? 0 : 20)
                .overlay(
                    Text(card.title)
                        .font(.system(size: isTapped ? 80 : 17))
                        .foregroundStyle(card.color)
                        .fontWeight(isTapped ? .bold : .semibold)
                    )
            
        }
    }
}

#Preview {
    CardView()
}
