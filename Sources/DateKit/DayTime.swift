//
//  DayTime.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-04.
//

import Foundation

/**
 `DayTime` represents an object containing the year, month and day, hour, minute, second and nanosecond components in a calendar. Its a convenience grouping of `Day` and `Time` object.
 
 Its purpose is to represent a Local Date and Time object.
 */
public struct DayTime {
    
    /**
     Get the time right now (current day and time).
     */
    public static var now: DayTime {
        let day = Day.today
        let time = Time.now
        return DayTime(day: day, time: time)
    }

    /**
     The nested object that represents the date componenents of this object.
     */
    public let day: Day
    
    /**
     The nested object that represents the time componenents of this object.
     */
    public let time: Time
    
    /**
     Initialize this object from a day and time
     */
    public init(day: Day, time: Time) {
        self.day = day
        self.time = time
    }

    /**
     Initialize the object from a year, month, day, hour, minute, second and nanosecond components. The components will be adjusted to fit in the current calendar system.
     */
    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int) {
        let dateComponents = DateComponents(calendar: .current, timeZone: .current, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        let date = dateComponents.date!
        self.init(from: date, in: .current)
    }
    
    /**
     Initialize the object from a date. The timezone provided will be used to extract the components.
     */
    public init(from date: Date, in timeZone: TimeZone) {
        let day = Day(from: date, in: timeZone)
        let time = Time(from: date, in: timeZone)
        self.init(day: day, time: time)
    }
    
    /**
     Convert this object to a Date object. The timezone will be used to create the correct timestamp.
     */
    public func date(in timeZone: TimeZone) -> Date {
        return day.date(with: time, in: timeZone)
    }
    
    /**
     Create a new object with the added time interval
     */
    public static func + (lhs: DayTime, timeInterval: TimeInterval) -> DayTime {
        let date = lhs.date(in: .current).adding(timeInterval)
        return DayTime(from: date, in: .current)
    }
    
    /**
     Create a new object with the subtracted time interval
     */
    public static func - (lhs: DayTime, timeInterval: TimeInterval) -> DayTime {
        let date = lhs.date(in: .current).subtracting(timeInterval)
        return DayTime(from: date, in: .current)
    }
    
    /**
     Create a new object with the added duration
     */
    public static func + (lhs: DayTime, duration: Duration) -> DayTime {
        return lhs + duration.timeInterval
    }
    
    /**
     Create a new object with the subtracted duration
     */
    public static func - (lhs: DayTime, duration: Duration) -> DayTime {
        return lhs - duration.timeInterval
    }
}

extension DayTime: Equatable {
    public static func == (lhs: DayTime, rhs: DayTime) -> Bool {
        return lhs.day == rhs.day && lhs.time == rhs.time
    }
}

extension DayTime: Comparable {
    public static func < (lhs: DayTime, rhs: DayTime) -> Bool {
        return lhs.date(in: .current) < rhs.date(in: .current)
    }
    
    public static func <=(lhs: DayTime, rhs: DayTime) -> Bool {
        return lhs.date(in: .current) <= rhs.date(in: .current)
    }
    
    public static func >=(lhs: DayTime, rhs: DayTime) -> Bool {
        return lhs.date(in: .current) >= rhs.date(in: .current)
    }
    
    public static func >(lhs: DayTime, rhs: DayTime) -> Bool {
        return lhs.date(in: .current) > rhs.date(in: .current)
    }
}

/**
 A typealias that uses the Android naming convention for the `DayTime` object.
 */
public typealias LocalDateTime = DayTime
