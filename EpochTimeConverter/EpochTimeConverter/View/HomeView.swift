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
                        NewUNIXpickerForm(
                            title: headings[index],
                            bodyOfText: bodyOfText[index],
                            tag: dateFormatTypes[index],
                            colour: colours[index],
                            isPickerUP: $isPickerUP
                        )
                        .environmentObject(controller)
                        .matchedGeometryEffect(id: dateFormatTypes[index], in: animation)
                        .onTapGesture {
                            tag = dateFormatTypes[index]
                            heading = headings[index]
                            subHeading = bodyOfText[index] + controller.setMessage(tag: tag)
                            withAnimation(.spring) {
                                isPickerUP = true
                            }
                        }
                    }
                }
                .listStyle(.plain) // <- if you want a flat clean style
                .navigationTitle("Discord Date & Time")
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
                                .shadow(radius: 2)
                        }
                    }
                    
                }
                
            }// end of ScrollView
            
        }// ZStack
        
        .overlay(
            Group {
                if isPickerUP {
                    UNIXpickerForm(
                        tag: tag,
                        heading: heading,
                        subHeading: subHeading
                    )
                    .cornerRadius(12)
                    .shadow(radius: 20)
                    .frame(width: 340, height: 300, alignment: .center)
                    .matchedGeometryEffect(id: tag, in: animation)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isPickerUP = false // tap again to dismiss
                        }
                    }
                }
            }
        )

        
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
        "Guys, the mission will start approximately ",
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




