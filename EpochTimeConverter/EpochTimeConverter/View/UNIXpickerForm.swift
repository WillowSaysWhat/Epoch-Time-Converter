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
    @EnvironmentObject var controller: HomeViewController
    let tag: String
    let heading: String
    let subHeading: String
    // Consts for
    let width: CGFloat = 60
    let height: CGFloat = 40
    let radius: CGFloat = 12
    
    @State var showAlert = false
    
    @State var textFieldOutput: String = "<t:000000000:f>"
    
    
    
    var body: some View {
        // manually build Form
        ZStack {
            // Grey background to the form
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.formGrey)
            
            VStack(alignment: .leading) {
                Text(heading)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all)
                // beginning of the user input.
                HStack {
                    Spacer()
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
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                // visual representation of the epoch snippet
                HStack {
                    Spacer()
                    TextField("<t:000000000:f>", text: $textFieldOutput) // try making this into a method call.
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 185)
                    // copy button.
                    Button {
                        controller.copyToClipboard()
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
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                
                // explains the type of epoch snippet
                Text(subHeading)
                    .font(.callout)
                    
            }
        }
    }
}


struct Copied: Tip {
    var title: Text {
        Text("Copied!")
    }
}

struct NewUNIXpickerForm: View {
    @EnvironmentObject var controller: HomeViewController
    let title: String
    let bodyOfText: String
    let tag: String
    let colour: Color
    @Binding var isPickerUP: Bool
    @State var showAlert = false
    //@State var displayDate: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.formGrey)
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Image("brand")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .clipShape(Circle())
                    
                    Text(title)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundStyle(colour)
                    Image(systemName: "crown.fill")
                        .foregroundStyle(colour)
                    Spacer()
                }// hstack title
                
                Text("\(bodyOfText)" + controller.setMessage(tag: tag) )
                    .font(.subheadline)
                    .padding(.horizontal, 16)
                    
                
            } // vstack
            .padding()
            
        } // Top zstack
    }// some view
}


#Preview {
    HomeView()
        .environmentObject(HomeViewController())
        
}
