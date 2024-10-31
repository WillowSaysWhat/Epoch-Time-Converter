//
//  HomeView.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import SwiftUI


struct HomeView: View {
    
    
    // instance of the controller for this view.
    @ObservedObject var controller = HomeViewController()
    	
    
    var body: some View {
        NavigationView {
            ZStack {
                
                ScrollView {
                    
                    UNIXpickerForm(controller: controller, tag: "long", heading: "Long Date & Time", subHeading: "eg: Mission step off 01 January, 2024 9:01 AM")
                    UNIXpickerForm(controller: controller, tag: "dayDateTime", heading: "Day, Date & Time", subHeading: "eg: Wednesday, January 01 2024 9:01 AM")
                    UNIXpickerForm(controller: controller, tag: "short", heading: "Short Date", subHeading: "eg: Mission is on 01 January, 2024")
                    UNIXpickerForm(controller: controller, tag: "abb", heading: "Abbreviated Date", subHeading: "eg: Mission is on the 01/01/2024")
                    UNIXpickerForm(controller: controller, tag: "tShort", heading: "Just Time", subHeading: "eg: Misson is at 10:00 AM")
                    UNIXpickerForm(controller: controller, tag: "rel", heading: "Relative Time", subHeading: "eg: 3 hours until mission starts")
                }
                .navigationTitle("Discord Date & Time")
                .navigationBarTitleDisplayMode(.large)
                
                NavigationLink(destination: HelpView()) {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.blue)
                        .shadow(radius: 10)
                    
                }.offset(x: -140, y: 270)
                
            }
            
        }// end of ScrollView
        
            
            
        }// some View
 }



#Preview {
    HomeView()
        
}




