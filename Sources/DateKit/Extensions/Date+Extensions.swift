//
//  Date+Extensions.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import Foundation

extension Date {
    
    /*
     A convenience method for calling `addingTimeInterval(:Duration)`
     */
    func adding(_ timeInterval: TimeInterval) -> Date {
        return addingTimeInterval(timeInterval)
    }
    
    /*
     A convenience method for calling `addingTimeInterval(:Duration)` when we want to subtract (negate) the time interval
     */
    func subtracting(_ timeInterval: TimeInterval) -> Date {
        return addingTimeInterval(-timeInterval)
    }
    
    /*
     Returns a Date with the added duration.
     */
    func adding(_ duration: Duration) -> Date {
        return adding(duration.timeInterval)
    }
    
    /*
     Returns a Date with the subtracted duration.
     */
    func subtracting(_ duration: Duration) -> Date {
        return subtracting(duration.timeInterval)
    }
    
    /*
     Adds the time interval to this object.
     */
    mutating func add(_ timeInterval: TimeInterval) {
        self.addTimeInterval(timeInterval)
    }
    
    /*
     Subtracts the time interval from this object.
     */
    mutating func subtract(_ timeInterval: TimeInterval) {
        self.addTimeInterval(-timeInterval)
    }
    
    /*
     Adds the duration to this object.
     */
    mutating func add(_ duration: Duration) {
        self.add(duration.timeInterval)
    }
    
    /*
     Subtracts the duration from this object.
     */
    mutating func subtract(_ duration: Duration) {
        self.subtract(duration.timeInterval)
    }
}
