//
//  DayTime.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-04.
//

import Foundation

/*
 DayTime object represents an object containing the year, month and day, hour, minute, second and nanosecond components in a calendar. Its a convenience grouping of Day and Time object.
 
 Its purpose is to represent a Local DateTime object
 */
struct DayTime {
    
    /*
     Get the time right now (current day and time).
     */
    static var now: DayTime {
        let day = Day.today
        let time = Time.now
        return DayTime(day: day, time: time)
    }
    
    let day: Day
    let time: Time
    
    /*
     Initialize this object from a day and time
     */
    init(day: Day, time: Time) {
        self.day = day
        self.time = time
    }

    /*
     Initialize the object from a year, month, day, hour, minute, second and nanosecond components. The components will be adjusted to fit in the current calendar system.
     */
    init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int) {
        let dateComponents = DateComponents(calendar: .current, timeZone: .current, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        let date = dateComponents.date!
        self.init(from: date, in: .current)
    }
    
    /*
     Initialize the object from a date. The timezone provided will be used to extract the components.
     */
    init(from date: Date, in timeZone: TimeZone) {
        let day = Day(from: date, in: timeZone)
        let time = Time(from: date, in: timeZone)
        self.init(day: day, time: time)
    }
    
    /*
     Convert this object to a Date object. The timezone will be used to create the correct timestamp.
     */
    func date(in timeZone: TimeZone) -> Date {
        return day.date(with: time, in: timeZone)
    }
    
    /*
     Create a new object with the added time interval
     */
    static func + (lhs: DayTime, timeInterval: TimeInterval) -> DayTime {
        let date = lhs.date(in: .current).adding(timeInterval)
        return DayTime(from: date, in: .current)
    }
    
    /*
     Create a new object with the subtracted time interval
     */
    static func - (lhs: DayTime, timeInterval: TimeInterval) -> DayTime {
        let date = lhs.date(in: .current).subtracting(timeInterval)
        return DayTime(from: date, in: .current)
    }
    
    /*
     Create a new object with the added duration
     */
    static func + (lhs: DayTime, duration: Duration) -> DayTime {
        return lhs + duration.timeInterval
    }
    
    /*
     Create a new object with the subtracted duration
     */
    static func - (lhs: DayTime, duration: Duration) -> DayTime {
        return lhs - duration.timeInterval
    }
}

extension DayTime: Equatable {
    static func == (lhs: DayTime, rhs: DayTime) -> Bool {
        return lhs.day == rhs.day && lhs.time == rhs.time
    }
}

extension DayTime: Comparable {
    static func < (lhs: DayTime, rhs: DayTime) -> Bool {
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

typealias LocalDateTime = DayTime
