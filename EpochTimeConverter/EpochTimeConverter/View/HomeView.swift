//
//  HomeView.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import SwiftUI


struct HomeView: View {
    
    
    // instance of the controller for this view.
    @EnvironmentObject var controller: HomeViewController
    @Environment(\.colorScheme) var themecheck
    @Namespace private var animation
    @State var isPickerUP = false
    // to pass the correct info to UNIXpickerForm
    @State var heading: String = ""
    @State var subHeading: String = ""
    @State var tag: String = ""
    
    var body: some View {
        NavigationView {
            ZStack { // places help button on top
                
                ScrollView {
                    ForEach(headings.indices, id: \.self) { index in
                        NavigationLink{
                           
                                UNIXpickerForm(
                                    tag: dateFormatTypes[index],
                                    heading: headings[index],
                                    subHeading: bodyOfText[index], colour: colours[index]
                                )
                            
                        } label: {
    
                            ZStack {
                                NewUNIXpickerForm(
                                    title: headings[index],
                                    bodyOfText: bodyOfText[index],
                                    tag: dateFormatTypes[index],
                                    colour: colours[index],
                                    isPickerUP: $isPickerUP
                                )
                                .environmentObject(controller)
                            }
                        
                        }
                        
                    }
                }
                .padding(.horizontal, 20)
                .navigationTitle("Your Local Time")
                .navigationBarTitleDisplayMode(.large)
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink(destination: HelpView()) {
                            Image(systemName: "questionmark.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)
                                .padding(.trailing, 13)
                        }
                    }
                    
                }
                
            }// end of ScrollView
            
        }// ZStack
        
        
        }// some View
    let headings: [String] = ["Relative Time", "Day & Date", "Short Date", "Long Date", "Long Time", "Short Time", "Short Date & Time", "Long Date & Time" ]
    let dateFormatTypes: [String] = [
        "relative",
        "default",
        "short",
        "long",
        "timeLong",
        "timeShort",
        "shortDateTime",
        "longDateTime"
    ]
    let bodyOfText: [String] = [
        "Guys, the mission will start approx ",
        "We have organised a mission for ",
        "We have organised a mission for the ",
        "We have organised a mission for the ",
        "The mission will be kicking off at ",
        "The mission will be kicking off at ",
        "We have organised a mission for the ",
        "We have organised a mission for "
    ]
    let colours: [Color] = [.indigo, .red, .blue, .green, .brown, .orange, .pink, .teal]
    
 }



#Preview {
    HomeView()
        .environmentObject(HomeViewController())
        
}




