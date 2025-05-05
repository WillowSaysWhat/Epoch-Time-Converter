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
    @Namespace private var animation
    @State var isPickerUP = false
    // to pass the correct info to UNIXpickerForm
    @State var heading: String = ""
    @State var subHeading: String = ""
    @State var tag: String = ""
    
    var body: some View {
        NavigationView {
            ZStack { // places help button on top
                
                List {
                    ForEach(headings.indices, id: \.self) { index in
                        NavigationLink{
                            UNIXpickerForm(
                                tag: dateFormatTypes[index],
                                heading: headings[index],
                                subHeading: bodyOfText[index], colour: colours[index]
                            )
                        } label: {
    
                        NewUNIXpickerForm(
                            title: headings[index],
                            bodyOfText: bodyOfText[index],
                            tag: dateFormatTypes[index],
                            colour: colours[index],
                            isPickerUP: $isPickerUP
                        )
                        .environmentObject(controller)
                        
                        }.buttonStyle(.bordered)
                        
                    }
                }
                .listStyle(.plain) // <- if you want a flat clean style
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
    let headings: [String] = ["Relative Time", "Long Date", "Short Date", "Pretty Date", "Long Time", "Short Time" ]
    let dateFormatTypes: [String] = [
        "relative",
        "long",
        "short",
        "prettyDate",
        "timeLong",
        "timeShort"
    ]
    let bodyOfText: [String] = [
        "Guys, the mission will start approx ",
        "We have organised a mission for ",
        "We have organised a mission for the ",
        "We have organised a mission for the ",
        "The mission will be kicking off at ",
        "The mission will be kicking off at "
    ]
    let colours: [Color] = [.yellow, .red, .blue, .green, .brown, .orange]
    
 }



#Preview {
    HomeView()
        .environmentObject(HomeViewController())
        
}




