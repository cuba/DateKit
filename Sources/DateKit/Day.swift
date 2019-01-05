//
//  Day.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-04.
//

import Foundation

/*
 Day object represents an object containing the year, month and day components in a calendar.
 
 Its purpose is to represent a Local Date object
 */
struct Day {
    
    /*
     Get today as a Day object
     */
    static var today: Day {
        return Day(from: Date(), in: .current)
    }
    
    let year: Int
    let month: Int
    let day: Int
    
    /*
     Get the next day. The day, month and year will always be adjusted to fit in the current calandar system.
     */
    var nextDay: Day {
        return self + TimeInterval.day
    }
    
    /*
     Get the previous day. The day, month and year will always be adjusted to fit in the current calandar system.
     */
    var previousDay: Day {
        return self - TimeInterval.day
    }
    
    /*
     Initialize the object from a year, month and day. The components will be adjusted to fit in the current calendar system.
     */
    init(year: Int, month: Int, day: Int) {
        let dateComponents = DateComponents(calendar: .current, timeZone: .current, year: year, month: month, day: day)
        let date = dateComponents.date!
        self.init(from: date, in: .current)
    }
    
    /*
     Initialize the object from a date. The time zone provided will be used to extract the correct components.
     */
    init(from date: Date, in timeZone: TimeZone) {
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: timeZone, from: date)
        self.year = components.year ?? 0
        self.month = components.month ?? 0
        self.day = components.day ?? 0
    }
    
    /*
     Convert the object into a date object with the given time and time zone.
     */
    func date(with time: Time, in timeZone: TimeZone) -> Date {
        let dateComponents = DateComponents(calendar: .current, timeZone: timeZone, year: year, month: month, day: day, hour: time.hour, minute: time.minute, second: time.second, nanosecond: time.nanosecond)
        return dateComponents.date!
    }
    
    /*
     Create a date range from midnight (start of day) in the given timezone to midnight of the next day in the given timezone.
     */
    func dateRange(in timeZone: TimeZone) -> Range<Date> {
        let startDate = date(with: .midnight, in: timeZone)
        let endDate = nextDay.date(with: .midnight, in: timeZone)
        return startDate..<endDate
    }
    
    /*
     Return a time interval since January 1, 1970 0:00:00 UTC in the provided time zone.
     */
    func timeIntervalSince1970(in timeZone: TimeZone) -> TimeInterval {
        return date(with: .midnight, in: timeZone).timeIntervalSince1970
    }
    
    /*
     Return a time interval since the provided day in the provided time zone.
     */
    func timeInterval(since day: Day, in timeZone: TimeZone) -> TimeInterval {
        return timeInterval(since: DayTime(day: day, time: .midnight), in: timeZone)
    }
    
    /*
     Return a time interval since the provided day and time in the provided time zone.
     */
    func timeInterval(since dayTime: DayTime, in timeZone: TimeZone) -> TimeInterval {
        return date(with: .midnight, in: timeZone).timeIntervalSince(dayTime.date(in: timeZone))
    }
    
    /*
     Return the number of days passed since the given day
     */
    func numberOfDays(since day: Day, in timeZone: TimeZone) -> Int {
        let difference = timeInterval(since: day, in: timeZone)
        return Int(difference / TimeInterval.day)
    }
    
    /*
     Return a date object extracting the time in the provided date and using the timezone provided.
     */
    func date(withTimeFrom date: Date, in timeZone: TimeZone) -> Date {
        let time = Time(from: date, in: timeZone)
        return self.date(with: time, in: timeZone)
    }
    
    /*
     Return a new object with the added TimeInterval. Any remaining time interval that is less than a day will be ignored.
     */
    static func + (lhs: Day, timeInterval: TimeInterval) -> Day {
        let date = lhs.date(with: .midnight, in: .current).adding(timeInterval)
        let day = Day(from: date, in: .current)
        return day
    }
    
    /*
     Return a new object with the subtracted TimeInterval. Any remaining time interval that is less than a day will be ignored.
     */
    static func - (lhs: Day, timeInterval: TimeInterval) -> Day {
        let date = lhs.date(with: .midnight, in: .current).subtracting(timeInterval)
        return Day(from: date, in: .current)
    }
}

extension Day: Equatable {
    
    static func ==(lhs: Day, rhs: Day) -> Bool {
        return lhs.day == rhs.day && lhs.month == rhs.month && lhs.year == rhs.year
    }
}

extension Day: Hashable {
    
    var hashValue: Int {
        return year.hashValue ^ month.hashValue ^ day.hashValue
    }
}

extension Day: Comparable {
    
    public static func <(lhs: Day, rhs: Day) -> Bool {
        return lhs.date(with: .midnight, in: .current) < rhs.date(with: .midnight, in: .current)
    }
    
    public static func <=(lhs: Day, rhs: Day) -> Bool {
        return lhs.date(with: .midnight, in: .current) <= rhs.date(with: .midnight, in: .current)
    }
    
    public static func >=(lhs: Day, rhs: Day) -> Bool {
        return lhs.date(with: .midnight, in: .current) >= rhs.date(with: .midnight, in: .current)
    }
    
    public static func >(lhs: Day, rhs: Day) -> Bool {
        return lhs.date(with: .midnight, in: .current) > rhs.date(with: .midnight, in: .current)
    }
}

typealias LocalDate = Day
