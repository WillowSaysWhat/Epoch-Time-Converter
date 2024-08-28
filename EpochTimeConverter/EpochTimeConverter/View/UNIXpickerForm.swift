//
//  UNIXpickerForm.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 28/08/2024.
//

import SwiftUI
import TipKit

struct UNIXpickerForm: View {
    
    let width: CGFloat = 60
    let height: CGFloat = 40
    let radius: CGFloat = 12
    let titleX: CGFloat = -85
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
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.formGrey)
            VStack {
                Text(heading)
                    .offset(x: titleX)
                    .padding(.all)
                HStack(alignment: .center) {
                    DatePicker("", selection: $controller.date)
                    Button {
                        textFieldOutput = controller.setEpoch(tag: tag)
                        // UIPasteboard.general.string = controller.epochTime
                        
                                }label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: radius)
                                .frame(width: width, height: height)
                                
                            Text("Apply")
                                .foregroundColor(.white)
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                // copy format row
                HStack {
                    TextField("<t:000000000:f>", text: $textFieldOutput) // try making this into a method call.
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                        
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
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Copied"))
                }
                    
                
                }
                .offset(x: 46)
                Text(subHeading)
                    .font(.caption2)
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
