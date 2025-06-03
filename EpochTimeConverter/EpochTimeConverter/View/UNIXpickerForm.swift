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
    let colour: Color
    

   
    
    @State var showAlert = false
    
    @State var textFieldOutput: String = "<t:000000000:f>"
    
    
    
    var body: some View {
        // manually build Form
        ZStack {
            // Grey background to the form
           // RoundedRectangle(cornerRadius: 12)
            //    .foregroundColor(Color.formGrey)
            
            VStack(alignment: .leading) {
                
                let textColor = (colour == .red) || (colour == .indigo) || (colour == .blue) || (colour == .pink) ? Color.white : Color.black
                
                Text(heading)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(colour)
                    .padding()
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
                                .foregroundStyle(colour)
                            Text("Apply")
                                .foregroundColor(textColor)
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
                                .foregroundStyle(colour)
                                
                            Text("Copy")
                                .foregroundColor(textColor)
                        }
                    }
                .alert(isPresented: $showAlert) { // popup that notifies the user.
                    Alert(title: Text("Copied"))
                }
                    
                
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                
                // explains the type of epoch snippet
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.formGrey)
                    
                    VStack(alignment: .leading) {
                        HStack() {
                            Image("brand")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .clipShape(Circle())
                                
                            
                            Text("Unknown User")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundStyle(colour)
                            Image(systemName: "crown.fill")
                                .foregroundStyle(colour)
                            Spacer()
                        }// hstack title
                        
                        HStack { // formatted text in the chat. eg. the mission will start in ...
                            Text("\(subHeading)")
                                .font(.system(size: 17, weight: .medium))
                            +
                            Text( controller.setMessage(tag: tag) )
                                .font(.system(size: 17, weight: .black))
                                .foregroundStyle(.primary)
                                
                            
                                
                        }
                        .padding(.horizontal, 16)
                        
                        
                    } // vstack
                    .padding()
                    
                }
                .frame(height:130)
                
                
                
                    HStack {
                        Text("Help")
                            .font(.title2)
                            .fontWeight(.medium)
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundStyle(.blue)
                    }
                    .padding(.leading,20)
                ScrollView {
                Text("To convert a date and time into an epoch timestamp using the app, first locate the date and time picker at the top of the screen. Simply tap on the date and adjust it to the specific day and time you would like to convert. You can scroll through the day, hour, and minute columns until the correct values are selected.Once you have set your desired date and time, tap the 'Apply' button. \n\nThis will immediately generate a corresponding epoch timestamp based on your chosen values. The app will display this timestamp in a formatted code snippet ready to be shared.\n\nTo copy the generated code snippet, simply tap the 'Copy' button. This action will automatically save the code snippet to your clipboard. \n\nAfter copying, you can swipe away or exit the app, open Discord, and then paste the code snippet into your message box by tapping and holding where you want to paste, then selecting Paste.")
                    .multilineTextAlignment(.leading)
                    .fontWeight(.light)
                    
                     
                Text("")
                    .multilineTextAlignment(.leading)
                    .fontWeight(.light)
                    
                Text("")
                    .multilineTextAlignment(.leading)
                    .fontWeight(.light)
                    
                }
                .padding()
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
    @Environment(\.colorScheme) var themecheck
    let title: String
    let bodyOfText: String
    let tag: String
    let colour: Color
    @Binding var isPickerUP: Bool
    @State var showAlert = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.formGrey)

            VStack(alignment: .leading) {
                // Title row
                HStack {
                    Circle()
                        .frame(width: 20)
                        .foregroundStyle(colour)
                        .opacity(0.6)

                    Text(title)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundStyle(colour)

                    Image(systemName: "crown.fill")
                        .foregroundStyle(colour)

                    Spacer()
                }

                // Message block, now split and aligned
                VStack(alignment: .leading, spacing: 2) {
                    Text(bodyOfText)
                        .foregroundStyle(themecheck == .dark ? .white : .black)
                        .font(.system(size: 17, weight: .medium))

                    Text(" " + controller.setMessage(tag: tag))
                        .foregroundStyle(themecheck == .dark ? .white : .black)
                        .font(.system(size: 17, weight: .black))
                }
                .padding(.horizontal, 20)
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .frame(maxWidth: .infinity, alignment: .leading) // ensures left alignment in any container
        }
    }
}


#Preview {
    HomeView()
        .environmentObject(HomeViewController())
        
}
