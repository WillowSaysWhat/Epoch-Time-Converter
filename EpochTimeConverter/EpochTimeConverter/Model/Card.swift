//
//  Card.swift
//  Your Local Time
//
//  Created by Huw Williams on 02/07/2025.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var tag: String
    var title: String
    var description: String
    var color: Color
    
}

var cards: [Card] = [
    Card(tag: "relative", title: "Relative Time", description: "Guys, the mission will start approx ", color: .indigo),
    Card(tag: "default", title: "Day & Date", description: "We have organised a mission for ", color: .red),
    Card(tag: "short", title: "Short Date", description: "We have organised a mission for the ", color: .blue),
    Card(tag: "long", title: "Long Date", description: "We have organised a mission for the ", color: .green),
    Card(tag: "timeLong", title: "Long Time", description: "The mission will be kicking off at ", color: .brown),
    Card(tag: "timeShort", title: "Short Time", description: "We have organised a mission for the ", color: .orange),
    Card(tag: "shortDateTime", title: "Short Date & Time", description: "We have organised a mission for the ", color: .pink),
    Card(tag: "longDateTime", title: "Long Date & Time", description: "We have organised a mission for ", color: .teal)
    ]
