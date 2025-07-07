//
//  HomeViewController.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import Foundation
import SwiftUI

// This object is init inside the Home View.
class HomeViewController: ObservableObject {
    // each type of date formatting has its own variable.
    // this stops all TextFields from updating when a single Copy button is pressed.
    @Published var date: Date = Calendar.current.date(byAdding: .hour, value: 2, to: .now)! // adds an hour to the example.
    @Published var epochTime: String = ""
    @Published var screenSize: CGSize = .zero
    let model = UNIXconvertion()
    
    // convert date to UNIX
    
    func setEpoch(tag:String) {
        switch tag {
        case "default":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):F>"
            
        case "long":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):D>"
            
        case "short":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):d>"
            
        case "relative":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):R>"
            
        case "timeLong":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):T>"
            
        case "timeShort":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):t>"
            
        case "longDateTime":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):F>"
            
        case "shortDateTime":
            self.epochTime = "<t:\(self.model.convertToEpoch(date: self.date)):f>"
            
        default:
            self.epochTime = "#ERROR"
            
        }
    }
    func setMessage(tag: String) -> String {
        let formatter = DateFormatter()
        let date = self.date  // Assuming `self.date` is a Date
        let now = Date()

        switch tag {
        case "relative":
            let relativeFormatter = RelativeDateTimeFormatter()
            relativeFormatter.unitsStyle = .full // could also use .short or .abbreviated
            return relativeFormatter.localizedString(for: date, relativeTo: now)
            
        case "short":
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: date)
            
        case "default":
            formatter.dateFormat = "EEEE d MMMM yyyy" // "Tuesday 3 September 2025"
            return formatter.string(from: date)
            
        case "long":
            formatter.dateFormat = "d MMMM yyyy" // "3 September 2025"
            return formatter.string(from: date)
            
        case "timeLong":
            formatter.dateFormat = "h:mm:ss a" // 24-hour time, like "2:35:00 PM "
            return formatter.string(from: date)
            
        case "timeShort":
            formatter.dateFormat = "h:mm a" // 12-hour time, like "2:35 PM"
            return formatter.string(from: date)
        
        case "longDateTime":
            formatter.dateFormat = "EEEE d MMMM yyyy h:mm a"
            return formatter.string(from: date)
        
        case "shortDateTime":
            formatter.dateFormat = "d MMM yyyy h:mm a"
            return formatter.string(from: date)
            
        default:
            return "#ERROR"
        }
    }
    
    // copies string variable to the device's clipboad.
    func copyToClipboard() {
        
        UIPasteboard.general.string = self.epochTime
        
    }
}
