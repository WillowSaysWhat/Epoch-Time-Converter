//
//  HelpView.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 02/09/2024.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Title
//                Text("How to use Discord Date & Time")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.bottom, 10)
                
                // Subtitle
                Text("Here you can find answers to frequently asked questions and get more information about how to use the app.")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                // Content Section
                Group {
                    // Section Title
                    Text("What is a UNIX timestamp?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    // Body Text
                    Text("""
                    A UNIX timestamp is a very simple global time code snippet that works by counting the seconds since 1970. This allows device users to view a timestamp from their timezone. This benefits multi-national squads, guilds, and outfits by displaying a correct timestamp for the person viewing it.
                    
                    This prevents misunderstandings that could see members jump online too early or too late for alloted events.
                    With a Discord Date & Time timestamp, a player will know exactrly when to be online.
                    
                    """)
                    .font(.body)
                    .foregroundColor(.primary)
                    
                    Text("How to get a timestamp.")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("""
                        * Pick a form with the desired format.
                        * select date and time.
                        * tap "Apply"
                        * tap "Copy"
                        * swipe out of Discord Date & Time
                        * paste the timestamp snippet into your announcement.
                    
                    The timestamp will appear once you have published (hit Enter) and is visible in your feed.
                    
                    """)
                    .font(.body)
                    .foregroundColor(.primary)
                    // Tips
                    
                }
                .padding(.bottom, 20)
                
                // Another Content Section
//                Group {
//                    // Section Title
//                    Text("Frequently Asked Questions")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                    
//                    // FAQ Example
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("Q: How do I reset my password?")
//                            .font(.headline)
//                            .foregroundColor(.secondary)
//                        
//                        Text("A: You can reset your password by going to the Settings section, tapping on 'Account', and selecting 'Reset Password'. Follow the on-screen instructions to complete the process.")
//                            .font(.body)
//                            .foregroundColor(.primary)
//                    }
//                }
//                .padding(.bottom, 20)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("How to use Discord Date & Time")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HelpView()
}
