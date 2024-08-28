//
//  HomeView.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import SwiftUI


struct HomeView: View {
    
    @ObservedObject var controller = HomeViewController()
    
    
    @Environment(\.colorScheme) var colourScheme
    var body: some View {
            NavigationStack {
                ScrollView {
                    UNIXpickerForm(controller: controller, tag: "long", heading: "Long Date & Time", subHeading: "eg: 01 January, 2024 9:01 AM")
                    UNIXpickerForm(controller: controller, tag: "short", heading: "Short Date", subHeading: "eg: 01 January, 2024")
                    UNIXpickerForm(controller: controller, tag: "abb", heading: "Abbreviated Date", subHeading: "eg: 01/01/2024")
                    UNIXpickerForm(controller: controller, tag: "rel", heading: "Relative Time", subHeading: "eg: 3 hours until mission starts")
                }
                .navigationTitle("Discord Date & Time")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.blue)
            }
            
        }// end of Geometryreader
 }// some View



#Preview {
    HomeView()
        
}




