//
//  CardView.swift
//  Your Local Time
//
//  Created by Huw Williams on 02/07/2025.
//

import SwiftUI

struct CardView: View {
    var card: Card = cards[1]
    @EnvironmentObject var controller: HomeViewController
    @State var textFieldOutput: String = "<t:000000000:f>"
    
    // @Binding var screenSize: CGSize
    @State var isTapped: Bool = false
    @State var isActive: Bool = false
    @State var time = Date.now
    
    var body: some View {
        
        ZStack {
            card.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 350)
                .cornerRadius(20)
            
            VStack(alignment: .center) {
                
                
                
                VStack(alignment: .leading) {
                    HStack {
                        // profile image
                        Image("brand")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .clipShape(Circle())
                        
                        Text("Unknown User")
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundStyle(card.color)
                        
                        Image(systemName: "crown.fill")
                            .foregroundStyle(card.color)
                    }
                    
                    Text(card.description)
                        .font(.subheadline)
                }
                
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Example")
                            .foregroundStyle(.secondary)
                        
                        Text("\(controller.setMessage(tag: card.tag))")
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Format")
                            .foregroundStyle(.secondary)
                        
                        Text("\(setFormatColumn(tag: card.tag))")
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Type")
                            .foregroundStyle(.secondary)
                        
                        Text("\(card.tag)")
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                .frame(maxHeight: 44)
                Divider()
                HStack {
                    
                    DatePicker("", selection: $controller.date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .padding(7)
                    
                    Image(systemName: "list.clipboard")
                        .offset(x: -8)
                    
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(linearGradient)
                }
                .frame(maxHeight: 44)
                
                
                Image(systemName: "sparkles")
                    .imageScale(.large)
                    .offset(y: 10)
            }
            .padding(20)
            .background(.ultraThinMaterial)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(linearGradient)
            }
            .cornerRadius(20)
            .padding(20)
            .offset(y: 80)
            
            // play button
            HStack {
                Image(systemName: isTapped ? "x.circle" : "play")
                Image(systemName: "repeat")
            }
            .font(.largeTitle)
            .padding(20)
            .background(.ultraThinMaterial)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(linearGradient)
            }
            .cornerRadius(20)
            .offset(y: -44)
        }
        .frame(maxWidth: 400)
        .dynamicTypeSize(.xSmall ... .xLarge)
        
    }
    
    // gradient on the border of the panel
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.clear, .primary.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    func setFormatColumn(tag: String) -> String {
        
        switch tag {
        case "default":
            return "<t:000000:F>"
        case "long":
            return "<t:000000:D>"
        case "short":
            return "<t:000000:d>"
        case "relative":
            return "<t:000000:R>"
        case "timeLong":
            return "<t:000000:T>"
        case "timeShort":
            return "<t:000000:t>"
        case "longDateTime":
            return "<t:000000:F>"
        case "shortDateTime":
            return "<t:000000:f>"
        default:
            return "#ERROR"
            
        }
    }
}

#Preview {
    CardView()
        .environmentObject(HomeViewController())
}


