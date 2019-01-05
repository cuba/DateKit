//
//  Time.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-04.
//

import Foundation

struct Time {
    
    static let midnight = Time(hour: 0, minute: 0, second: 0, nanosecond: 0)!
    
    static var now: Time {
        return Time(from: Date(), in: .current)
    }
    
    var hour = 0
    var minute = 0
    var second = 0
    var nanosecond = 0
    
    var interval: TimeInterval {
        return Double(second) + TimeInterval.minute * Double(minute) + TimeInterval.hour * Double(hour) + Double(nanosecond / 1000)
    }
    
    init(from interval: TimeInterval) {
        var interval = interval
        let hour = Int(interval / TimeInterval.hour)
        interval = interval - (Double(hour) * TimeInterval.hour)
        let minute = Int(interval / TimeInterval.minute)
        interval = interval - (Double(minute) * TimeInterval.minute)
        let second = Int(interval)
        interval = interval - Double(second)
        let nanosecond = Int(interval * 1000)
        
        self.init(hour: hour, minute: minute, second: second, nanosecond: nanosecond)!
    }
    
    init?(hour: Int, minute: Int, second: Int, nanosecond: Int = 0) {
        let dateComponents = DateComponents(calendar: .current, timeZone: .current, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        guard let date = dateComponents.date else { return nil }
        
        self.init(from: date, in: .current)
    }
    
    init(from date: Date, in timeZone: TimeZone) {
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: timeZone, from: date)
        
        self.hour = components.hour ?? 0
        self.minute = components.minute ?? 0
        self.second = components.second ?? 0
        self.nanosecond = components.nanosecond ?? 0
    }
    
    func date(with day: Day, in timeZone: TimeZone) -> Date {
        return day.date(with: self, in: timeZone)
    }
}

extension Time: Equatable {
    public static func ==(lhs: Time, rhs: Time) -> Bool {
        return lhs.hour == rhs.hour && lhs.minute == rhs.minute && lhs.second == rhs.second && lhs.nanosecond == rhs.nanosecond
    }
}

extension Time: Comparable {
    public static func <(lhs: Time, rhs: Time) -> Bool {
        return lhs.interval < rhs.interval
    }
    
    public static func <=(lhs: Time, rhs: Time) -> Bool {
        return lhs.interval <= rhs.interval
    }
    
    public static func >=(lhs: Time, rhs: Time) -> Bool {
        return lhs.interval >= rhs.interval
    }
    
    public static func >(lhs: Time, rhs: Time) -> Bool {
        return lhs.interval > rhs.interval
    }
}

extension Time: Hashable {
    var hashValue: Int {
        return hour ^ minute ^ second ^ nanosecond
    }
}

struct TimeRange {
    static let allDay = TimeRange(startTime: .midnight, endTime: .midnight)
    var startTime: Time
    var endTime: Time
}
