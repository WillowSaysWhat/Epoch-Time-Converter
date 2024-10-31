//
//  UNIXpickerForm.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 28/08/2024.
//
// This is the Time Picker From.
// It is used multiple times in HomeView
import SwiftUI
import TipKit

struct UNIXpickerForm: View {
    // Consts for 
    let width: CGFloat = 60
    let height: CGFloat = 40
    let radius: CGFloat = 12
    let heading: String
    let subHeading: String
    @State var showAlert = false
    
    @State var textFieldOutput: String = "<t:000000000:f>"
    
    let tag: String
    @ObservedObject var controller: HomeViewController
    
    init(controller: HomeViewController, tag: String, heading:String, subHeading: String) {
        
        self.controller = controller
        self.tag = tag
        self.heading = heading
        self.subHeading = subHeading
        
        
    }
    var body: some View {
        // manually build Form
        ZStack {
            // Grey background to the form
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.formGrey)
            
            VStack(alignment: .leading) {
                Text(heading)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all)
                // beginning of the user input.
                HStack {
                    DatePicker("", selection: $controller.date)
                    // Apply button
                    Button {
                        textFieldOutput = controller.setEpoch(tag: tag)
                        
                        
                                }label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: radius)
                                .frame(width: width, height: height)
                                
                            Text("Apply")
                                .foregroundColor(.white)
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                // visual representation of the epoch snippet
                HStack {
                    TextField("<t:000000000:f>", text: $textFieldOutput) // try making this into a method call.
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 185)
                    // copy button.
                    Button {
                        controller.copyToClipboard(tag: tag)
                        showAlert = true
                                }
                label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: radius)
                                .frame(width: width, height: height)
                                
                            Text("Copy")
                                .foregroundColor(.white)
                        }
                    }
                .alert(isPresented: $showAlert) { // popup that notifies the user.
                    Alert(title: Text("Copied"))
                }
                    
                
                }
                .padding(EdgeInsets(top: 0, leading: 120, bottom: 0, trailing: 0))
                
                // explains the type of epoch snippet
                Text(subHeading)
                    .font(.callout)
                    .padding(.all)
            }
        }.padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
}


#Preview {
    UNIXpickerForm(controller: HomeViewController(), tag: "long", heading: "Long Date & Time", subHeading: "eg: 01 January, 2024 9:01 AM")
}

struct Copied: Tip {
    var title: Text {
        Text("Copied!")
    }
}
