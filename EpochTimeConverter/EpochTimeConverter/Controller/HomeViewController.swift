//
//  HomeViewController.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import Foundation
import SwiftUI

class HomeViewController: ObservableObject {
    
    @Published var date = Date()
    @Published var epochTimeLong = String()
    @Published var epochTimeShort = String()
    @Published var epochTimeAbb = String()
    @Published var epochTimeRel = String()
    let model = UNIXconvertion()
    
    // convert date to UNIX
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
        default:
            self.epochTimeLong = "#ERROR"
            return self.epochTimeLong 
        }
    }
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
        default:
            UIPasteboard.general.string = "#ERROR IN PASTE"
        }
    }
}
