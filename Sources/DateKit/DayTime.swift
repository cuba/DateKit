//
//  DayTime.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-04.
//

import Foundation

struct DayTime {
    
    static var now: DayTime {
        let day = Day.today
        let time = Time.now
        return DayTime(day: day, time: time)
    }
    
    let day: Day
    let time: Time
    
    init(day: Day, time: Time) {
        self.day = day
        self.time = time
    }
    
    init(from date: Date, in timeZone: TimeZone) {
        let day = Day(from: date, in: timeZone)
        let time = Time(from: date, in: timeZone)
        self.init(day: day, time: time)
    }
    
    func date(in timeZone: TimeZone) -> Date {
        return day.date(with: time, in: timeZone)
    }
    
    static func + (lhs: DayTime, timeInterval: TimeInterval) -> DayTime {
        let date = lhs.date(in: .current).adding(timeInterval)
        return DayTime(from: date, in: .current)
    }
    
    static func - (lhs: DayTime, timeInterval: TimeInterval) -> DayTime {
        let date = lhs.date(in: .current).subtracting(timeInterval)
        return DayTime(from: date, in: .current)
    }
    
    static func + (lhs: DayTime, duration: Duration) -> DayTime {
        return lhs + duration.timeInterval
    }
    
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
