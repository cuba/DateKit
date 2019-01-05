//
//  Day.swift
//  DateKit
//
//  Created by Jacob Sikorski on 2019-01-04.
//

import Foundation


struct Day {
    
    static var today: Day {
        return Day(from: Date(), in: .current)
    }
    
    let year: Int
    let month: Int
    let day: Int
    
    var nextDay: Day {
        return self + 1
    }
    
    private init?(year: Int, month: Int, day: Int) {
        let dateComponents = DateComponents(calendar: .current, timeZone: .current, year: year, month: month, day: day)
        guard let date = dateComponents.date else { return nil }
        self.init(from: date, in: .current)
    }
    
    init(from date: Date, in timeZone: TimeZone = .current) {
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: timeZone, from: date)
        self.year = components.year ?? 0
        self.month = components.month ?? 0
        self.day = components.day ?? 0
    }
    
    func date(with time: Time, in timeZone: TimeZone) -> Date {
        let dateComponents = DateComponents(calendar: .current, timeZone: timeZone, year: year, month: month, day: day)
        return dateComponents.date!
    }
    
    func dateRange(in timeZone: TimeZone) -> Range<Date> {
        let startDate = date(with: .midnight, in: timeZone)
        let endDate = startDate
        return startDate..<endDate
    }
    
    func timeIntervalSince1970(in timeZone: TimeZone) -> TimeInterval {
        return date(with: Time.midnight, in: timeZone).timeIntervalSince1970
    }
    
    func timeInterval(since day: Day, in timeZone: TimeZone) -> TimeInterval {
        return date(with: Time.midnight, in: timeZone).timeIntervalSince(day.date(with: Time.midnight, in: timeZone))
    }
    
    func numberOfDays(since day: Day, in timeZone: TimeZone) -> Int {
        let difference = timeInterval(since: day, in: timeZone)
        return Int(difference / TimeInterval.day)
    }
    
    func date(withTimeFrom date: Date, in timeZone: TimeZone) -> Date {
        let time = Time(from: date, in: timeZone)
        return self.date(with: time, in: timeZone)
    }
    
    static func + (lhs: Day, days: UInt) -> Day {
        let timeInterval = TimeInterval.day * Double(days)
        let date = lhs.date(with: Time.midnight, in: .current).addingTimeInterval(timeInterval)
        let day = Day(from: date, in: .current)
        return day
    }
    
    static func - (lhs: Day, days: UInt) -> Day {
        let timeInterval = TimeInterval.day * -Double(days)
        let date = lhs.date(with: Time.midnight, in: .current).addingTimeInterval(timeInterval)
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
        return lhs.date(with: Time.midnight, in: .current) < rhs.date(with: Time.midnight, in: .current)
    }
    
    public static func <=(lhs: Day, rhs: Day) -> Bool {
        return lhs.date(with: Time.midnight, in: .current) <= rhs.date(with: Time.midnight, in: .current)
    }
    
    public static func >=(lhs: Day, rhs: Day) -> Bool {
        return lhs.date(with: Time.midnight, in: .current) >= rhs.date(with: Time.midnight, in: .current)
    }
    
    public static func >(lhs: Day, rhs: Day) -> Bool {
        return lhs.date(with: Time.midnight, in: .current) > rhs.date(with: Time.midnight, in: .current)
    }
}

extension ClosedRange where Bound == Day {
    
    func toArray() -> [Day] {
        var dayArray: [Day] = []
        
        let lowerBoundDate = lowerBound.date(with: .midnight, in: .current)
        let upperBoundDate = upperBound.date(with: .midnight, in: .current)
        
        var currentDate = lowerBoundDate
        
        while currentDate <= upperBoundDate {
            dayArray.append(Day(from: currentDate, in: .current))
            currentDate = currentDate.addingTimeInterval(.day)
        }
        return dayArray
    }
    
    func index(of day: Day) -> Int? {
        let array = toArray()
        return array.index(of: day)
    }
}

typealias LocalDate = Day
