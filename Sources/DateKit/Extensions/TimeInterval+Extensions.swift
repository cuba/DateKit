//
//  TimeInterval+Extensions.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import Foundation

extension TimeInterval {
    
    /*
     A single nanosecond represented as a time interval (0.001 second).
     */
    static let nanosecond: TimeInterval = 0.001
    
    /*
     A single second represented as a time interval (1 second).
     */
    static let second: TimeInterval = 1
    
    /*
     A single day represented as a time interval (60 seconds).
     */
    static let minute: TimeInterval = 60
    
    /*
     A single hour represented as a time interval (3600 seconds).
     */
    static let hour: TimeInterval = 3600
    
    /*
     A single day represented as a time interval (86400 seconds).
     */
    static let day: TimeInterval = 86400
    
    /*
     A single week represented as a time interval. (604800 seconds)
     */
    static let week: TimeInterval = 604800
}
