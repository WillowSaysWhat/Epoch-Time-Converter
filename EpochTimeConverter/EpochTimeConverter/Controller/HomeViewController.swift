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
    @Published var date = Date()
    @Published var epochTimeLong = String()
    @Published var epochTimeShort = String()
    @Published var epochTimeAbb = String()
    @Published var epochTimeRel = String()
    @Published var epochTimeTimeShort = String()
    @Published var epochTimeDayDateTime = String()
    let model = UNIXconvertion()
    
    // convert date to UNIX
    // each case interacts only with the corresponding variable.
    // This is because multiple instances of the button interact with a single instance of this class.
    // this can cause duplicate actions over all forms from a single button click.
    func setEpoch(tag:String)->String {
        
        switch tag {
        case "long":
            self.epochTimeLong = "<t:\(self.model.convertToEpoch(date: self.date)):f>"
            return self.epochTimeLong
        case "short":
            self.epochTimeShort = "<t:\(self.model.convertToEpoch(date: self.date)):D>"
            return self.epochTimeShort
        case "abb":
            self.epochTimeAbb = "<t:\(self.model.convertToEpoch(date: self.date)):d>"
            return self.epochTimeAbb
        case "rel":
            self.epochTimeRel = "<t:\(self.model.convertToEpoch(date: self.date)):d>"
            return self.epochTimeRel
        case "tShort":
            self.epochTimeTimeShort = "<t:\(self.model.convertToEpoch(date: self.date)):t>"
            return self.epochTimeTimeShort
        case "dayDateTime":
            self.epochTimeDayDateTime = "<t:\(self.model.convertToEpoch(date: self.date)):t>"
            return self.epochTimeDayDateTime
        default:
            self.epochTimeLong = "#ERROR"
            return self.epochTimeLong 
        }
    }
    
    // copies string variable to the device's clipboad.
    func copyToClipboard(tag:String) {
        
        switch tag {
        case "long":
            UIPasteboard.general.string = epochTimeLong
        case "short":
            UIPasteboard.general.string = epochTimeShort
        case "abb":
            UIPasteboard.general.string = epochTimeAbb
        case "rel":
            UIPasteboard.general.string = epochTimeRel
        case "tShort":
            UIPasteboard.general.string = epochTimeTimeShort
        case "dayDateTime":
            UIPasteboard.general.string = epochTimeDayDateTime
        default:
            UIPasteboard.general.string = "#ERROR IN PASTE"
        }
    }
}
