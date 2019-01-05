//
//  Time.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-04.
//

import Foundation

/*
 Time object represents an object containing the hour, minute and second and nanosecond components in a calendar.
 
 Since time is circular (starts at 0 and ends back at 0), time is not comparable as 3am may be larger than 9am.  To compare time we need more information (such as the day).
 */
struct Time {
    
    /*
     Get the time at midnight (00:00:00). This can also be seen as the start of the day.
     */
    static let midnight = Time(hour: 0, minute: 0, second: 0, nanosecond: 0)
    
    /*
     Get the time right now.
     */
    static var now: Time {
        return Time(from: Date(), in: .current)
    }
    
    let hour: Int
    let minute: Int
    let second: Int
    let nanosecond: Int
    
    /*
     Get the time interval representation of this time.
     */
    var interval: TimeInterval {
        return Double(second) + TimeInterval.minute * Double(minute) + TimeInterval.hour * Double(hour) + TimeInterval.nanosecond * Double(nanosecond)
    }
    
    /*
     Create this object from components
     */
    init(hour: Int, minute: Int, second: Int, nanosecond: Int = 0) {
        self.hour = hour
        self.minute = minute
        self.second = second
        self.nanosecond = nanosecond
    }
    
    /*
     Create this object from a given date. The time zone provided will be used to extract the components.
     */
    init(from date: Date, in timeZone: TimeZone) {
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: timeZone, from: date)
        self.init(hour: components.hour ?? 0, minute: components.minute ?? 0, second: components.second ?? 0, nanosecond: components.nanosecond ?? 0)
    }
    
    /*
     Create a date object for the given day. The time zone provided will be used to convert the object to the correct timestamp.
     */
    func date(with day: Day, in timeZone: TimeZone) -> Date {
        return day.date(with: self, in: timeZone)
    }
}

extension Time: Equatable {
    public static func ==(lhs: Time, rhs: Time) -> Bool {
        return lhs.hour == rhs.hour && lhs.minute == rhs.minute && lhs.second == rhs.second && lhs.nanosecond == rhs.nanosecond
    }
}

extension Time: Hashable {
    var hashValue: Int {
        return hour ^ minute ^ second ^ nanosecond
    }
}

/*
 An object that represents start time and end time. A range can not be used as time in not comparable.  See the `Time` object for information.
 
 For example 10pm to 3am would be represented as 22:00:00 to 03:00:00 where it is understood that the 3am represents the next day.
 
 In addition, since there is no day representation on this object the time range can never be longer than 24 hours.
 */
struct TimeRange {
    /*
     Create a time range representing all day (from midnight to midnight). Since there is no day representation on a time object, the object created can also be seen as a range with 0 duration.
     */
    static let allDay = TimeRange(startTime: .midnight, endTime: .midnight)
    
    /*
     Represents the lower bound (start) of the range
     */
    var startTime: Time
    
    /*
     Represents the upper bound (end) of the range. Since there is no day representation on this object, the end time can be a lower value than the start time. In this case, it is understood that the end time then represents the time on the following day.
     */
    var endTime: Time
}
