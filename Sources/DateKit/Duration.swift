//
//  Duration.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import Foundation

/*
 Duration represents time passed (or time that will pass) in weeks, days and hours, minutes, seconds and nanoseconds. It provides a way to represent date components that can be converted to a time interval without knowing the reference date.
 
 Years, and months are not supported as they cannot be converted to a time interval without knowing a reference date and time zone. The reason for this is because the length of a month or year (in seconds) changes depending on the reference date. Leap years, for example, are shorter in seconds than non-leap years and a single month may be between 28 days (i.e. February) to 31 days (ex: December).
 */
struct Duration {
    var weeks = 0
    var days = 0
    var hours = 0
    var minutes = 0
    var seconds = 0
    var nanoseconds = 0
    
    /*
     Create the object with the elapsed duration in terms of its individual components.
     */
    init(weeks: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0, nanoseconds: Int = 0) {
        self.weeks = weeks
        self.days = days
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
        self.nanoseconds = nanoseconds
    }
    
    /*
     Create the object from a time object.
     */
    init(from time: Time) {
        self.init(hours: time.hour, minutes: time.minute, seconds: time.second, nanoseconds: time.nanosecond)
    }
    
    /*
     Get the time interval representation of this duration.
     */
    var timeInterval: TimeInterval {
        var timeInterval = TimeInterval.week * Double(weeks)
        timeInterval = timeInterval + (TimeInterval.day * Double(days))
        timeInterval = timeInterval + (TimeInterval.hour * Double(hours))
        timeInterval = timeInterval + (TimeInterval.minute * Double(minutes))
        timeInterval = timeInterval + (TimeInterval.second * Double(seconds))
        timeInterval = timeInterval + (TimeInterval.nanosecond * Double(nanoseconds))
        
        return timeInterval
    }
    
    /*
     Create a new object with the added duration.
     */
    static func + (lhs: Duration, rhs: Duration) -> Duration {
        return lhs.adding(rhs)
    }
    
    /*
     Create a new object with the subtracted duration.
     */
    static func - (lhs: Duration, rhs: Duration) -> Duration {
        return lhs.subtracting(rhs)
    }
    
    /*
     Add the provided duration to this object.
     */
    mutating func add(_ duration: Duration) {
        weeks = weeks + duration.weeks
        days = days + duration.days
        hours = hours + duration.hours
        minutes = minutes + duration.minutes
        seconds = seconds + duration.seconds
        nanoseconds = nanoseconds + duration.nanoseconds
    }
    
    /*
     Subtract the provided duration from this object.
     */
    mutating func subtract(_ duration: Duration) {
        weeks = weeks - duration.weeks
        days = days - duration.days
        hours = hours - duration.hours
        minutes = minutes - duration.minutes
        seconds = seconds - duration.seconds
        nanoseconds = nanoseconds - duration.nanoseconds
    }
    
    /*
     Create a new object with the added duration.
     */
    func adding(_ duration: Duration) -> Duration {
        return Duration(weeks: weeks + duration.weeks, days: days + duration.days, hours: hours + duration.hours, minutes: minutes + duration.minutes, seconds: seconds + duration.seconds, nanoseconds: nanoseconds + duration.nanoseconds)
    }
    
    /*
     Create a new object with the subtracted duration.
     */
    func subtracting(_ duration: Duration) -> Duration {
        return Duration(weeks: weeks - duration.weeks, days: days - duration.days, hours: hours - duration.hours, minutes: minutes - duration.minutes, seconds: seconds - duration.seconds, nanoseconds: nanoseconds - duration.nanoseconds)
    }
}

extension Duration: Equatable {
    public static func == (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.weeks == rhs.weeks
            && rhs.days == rhs.days
            && rhs.hours == rhs.hours
            && rhs.minutes == rhs.minutes
            && rhs.seconds == rhs.seconds
            && rhs.nanoseconds == rhs.nanoseconds
    }
}
