//
//  UNIXconvertion.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import Foundation

class UNIXconvertion : ObservableObject {
       
    // converts the date-time variable into epoch/UNIX time stamp and returns it as a string.
    // type casts the Double to a string so there is no decimal. This creates an output without milliseconds. 
    func convertToEpoch(date: Date) -> Int{
        
        let unixTime = date.timeIntervalSince1970.rounded()
        
        return Int(unixTime)
        
    }
    
    
    
    
}


