//
//  Duration.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import Foundation

struct Duration {
    var weeks = 0
    var days = 0
    var hours = 0
    var minutes = 0
    var seconds = 0
    var nanoseconds = 0
    
    init(weeks: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0, nanoseconds: Int = 0) {
        self.weeks = weeks
        self.days = days
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
        self.nanoseconds = nanoseconds
    }
    
    init(from time: Time) {
        self.init(hours: time.hour, minutes: time.minute, seconds: time.second, nanoseconds: time.nanosecond)
    }
    
    var timeInterval: TimeInterval {
        var timeInterval = TimeInterval.week * Double(weeks)
        timeInterval = timeInterval + (TimeInterval.day * Double(days))
        timeInterval = timeInterval + (TimeInterval.hour * Double(hours))
        timeInterval = timeInterval + (TimeInterval.minute * Double(minutes))
        timeInterval = timeInterval + (TimeInterval.second * Double(seconds))
        timeInterval = timeInterval + (TimeInterval.nanosecond * Double(nanoseconds))
        
        return timeInterval
    }
}
