//
//  Date+Extensions.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import Foundation

extension Date {
    func adding(_ timeInterval: TimeInterval) -> Date {
        return addingTimeInterval(timeInterval)
    }
    
    func subtracting(_ timeInterval: TimeInterval) -> Date {
        return addingTimeInterval(-timeInterval)
    }
    
    func adding(_ duration: Duration) -> Date {
        return adding(duration.timeInterval)
    }
    
    func subtracting(_ duration: Duration) -> Date {
        return subtracting(duration.timeInterval)
    }
    
    mutating func add(_ timeInterval: TimeInterval) {
        self.addTimeInterval(timeInterval)
    }
    
    mutating func subtract(_ timeInterval: TimeInterval) {
        self.addTimeInterval(-timeInterval)
    }
    
    mutating func add(_ duration: Duration) {
        self.add(duration.timeInterval)
    }
    
    mutating func subtract(_ duration: Duration) {
        self.subtract(duration.timeInterval)
    }
}
