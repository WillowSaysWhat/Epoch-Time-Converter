//
//  UNIXconvertion.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import Foundation

class UNIXconvertion : ObservableObject {
       
    
    func convertToEpoch(date: Date) -> String{
        
        let unixTime = date.timeIntervalSince1970.rounded()
        
        let unixFormatted = String(Int(unixTime))
        
        return unixFormatted
        
    }
    
    
}


