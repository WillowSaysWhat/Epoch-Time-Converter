//
//  DateTimeFormatting.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import Foundation

class DateTimeFormatting: ObservableObject {
    
    func onlyTimeFormat(epoch:Double) -> String {
        
        let epochToTime = Date(timeIntervalSince1970: epoch)
        
        return "<t:\():t"
    }
}
