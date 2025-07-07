//
//  CardView.swift
//  Your Local Time
//
//  Created by Huw Williams on 02/07/2025.
//

import SwiftUI

struct CardView: View {
    var card: Card = cards[4]
    @EnvironmentObject var controller: HomeViewController
    var textFieldOutput: String = "<t:000000000:f>"
    
    // each card needs its own tapped and copied.
    @State var isTapped: Bool = false
    @State var isCopied: Bool = false
    
    
    
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            ImageCard // located a the bottom of the struct.
            // width and height animator
            // move onTap
            VStack(alignment: .center) {
                UnknownUser // description is in here
                ExampleFormatTypeColoumn
                Divider()
                DateAndTimePicker
                Image(systemName: "sparkles")
                    .imageScale(.large)
                    .offset(y: 10)
            }
            .padding(20)
            .background(.ultraThinMaterial)
            .overlay { // gradient border that goes around the outside of the card
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(linearGradient)
            }
            .cornerRadius(20)
            .padding(40)
            .offset(y: isTapped ? 240: 80) // makes the card
            
            
            // Plus and Clipboad Panel above the main card
            PlusAndClipboard
        }
        .frame(maxWidth: controller.screenSize.width)
        .padding(.vertical, 10)
        .dynamicTypeSize(.xSmall ... .xLarge)
        
    } // end of view
    
    
    // ###### Widgets #####
    /*
     1. Liner gradient variable used to give the outline on the cards
     2. Function that decides which string should be shown in the format column.
     3. The large card in the background.
     4. Unknown User title with description.
     5. Horizontal columns with Example, Format, Type.
     6. Smaller card with plus and clipboard icons.
     7. Date and Time Picker.
     */
    
    // MARK: 1
    // gradient on the border of the panel
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.clear, .primary.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    // MARK: 2
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
    // MARK: 3
    var ImageCard: some View {
        card.image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: isTapped ? controller.screenSize.height - 280 : 500) // animate image height
            .frame(width: isTapped ? controller.screenSize.width - 40 : 370 ) // animate image width
            .overlay {
                Text(card.title) // card title
                    .font(.system(size: isTapped ? 70: 20))
                    .foregroundStyle(.white)
                    .fontWeight(isTapped ? .heavy : .semibold)
                    .padding()
                    .shadow(color: .black, radius: 10, y: 10)
                    .frame(maxHeight: .infinity, alignment: isTapped ? .center : .top)
            }
            .cornerRadius(isTapped ? 0 : 20) // animate image corner radius
            .overlay { // gradient outline
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(linearGradient)
                    .opacity(isTapped ? 0 : 1)
            }
            .offset(y: isTapped ? -200 : 0) // moves the image onTapped
    }
    
    // MARK: 4
    var UnknownUser: some View { // heading of "unknow user"
        
        VStack(alignment: .leading) {
            HStack {
                // profile image
                Image("brand") // circle
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .clipShape(Circle())
                
                Text("Unknown User") // title
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(card.color)
                
                Image(systemName: "crown.fill") // icon
                    .foregroundStyle(card.color)
            }
            // description
            Text(card.description)
                .font(.subheadline)
            
        }
    }
    
    // MARK: 5
    var ExampleFormatTypeColoumn: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Example")
                    .foregroundStyle(.secondary)
                
                Text("\(controller.setMessage(tag: card.tag))")
                
            }
            .font(.system(size: 11))
            .fontWeight(.semibold)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Format")
                    .foregroundStyle(.secondary)
                
                Text("\(setFormatColumn(tag: card.tag))")
                
            }
            .font(.system(size: 11))
            .fontWeight(.semibold)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Type")
                    .foregroundStyle(.secondary)
                
                Text("\(card.tag)")
                
            }
            .font(.system(size: 11))
            .fontWeight(.semibold)
        }
        .frame(maxHeight: 44)
    }
    
    // MARK: 6
    var PlusAndClipboard: some View {
        
        HStack(spacing: 30) {
            //
            Image(systemName: isTapped ? "x.circle" : "plus")
                .frame(width: 44)
                .contentTransition(.symbolEffect(.replace)) // button animation.
                .onTapGesture {
                    withAnimation(.bouncy) {
                        isTapped.toggle()
                    }
                }
            
            if isTapped {
                
                Image(systemName: isCopied ? "checkmark" : "list.clipboard")
                    .frame(width: 44)
                    .contentTransition(.symbolEffect(.replace)) // button animation.
                    .opacity(isTapped ? 1 : 0) // hides clipboard until card is open.
                    .onTapGesture {
                        isCopied.toggle()
                        // copy to clipboard
                        controller.setEpoch(tag: card.tag)
                        controller.copyToClipboard()
                    }
            }
        // the frame grows when the plus is tapped.
        // uses the ultra thin material.
        
        }
        .frame(width: isTapped ? 110 : 40)
        .font(.largeTitle)
        .padding()
        .background(.ultraThinMaterial)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(linearGradient)
        }
        .cornerRadius(20)
        .offset(y: isTapped ? 40 : -55)
        
    }
    // MARK: 7
    var DateAndTimePicker: some View {
        
        // default iOS date picker.
        // colour has been changed to match theme.
        // uses the glass colour gradient.
        // the picker is disabled until the card is opened.

        DatePicker("", selection: $controller.date)
            .datePickerStyle(.compact)
            .tint(card.color)
            .labelsHidden()
            .padding(7)
            .overlay { // gradient outline
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(linearGradient)
            }
            .frame(maxHeight: 44)
            .disabled(!isTapped)
    }
}

#Preview {
    CardView()
        .environmentObject(HomeViewController())
}


