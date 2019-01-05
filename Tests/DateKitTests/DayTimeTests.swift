//
//  DayTimeTests.swift
//  DateKitTests
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import XCTest
@testable import DateKit

class DayTimeTests: XCTestCase {
    
    func testAddingTimeInterval() {
        // Given
        let day = Day(year: 1984, month: 06, day: 23)
        let dayTime = DayTime(day: day, time: .midnight)
        let testInterval = (TimeInterval.week * 1) + (TimeInterval.day * 1) + (TimeInterval.hour * 1) + (TimeInterval.minute * 1) + (TimeInterval.second * 1) + (TimeInterval.nanosecond * 0)
        
        // When
        let result = dayTime + testInterval
        
        // Then
        let testDay = Day(year: 1984, month: 7, day: 1)
        let testTime = Time(hour: 1, minute: 1, second: 1, nanosecond: 0)
        let testDayTime = DayTime(day: testDay, time: testTime)
        XCTAssertEqual(testDayTime, result)
    }
    
    func testSubtractingTimeInterval() {
        // Given
        let day = Day(year: 1984, month: 06, day: 23)
        let dayTime = DayTime(day: day, time: .midnight)
        let testInterval = (TimeInterval.week * 1) + (TimeInterval.day * 1) + (TimeInterval.hour * 1) + (TimeInterval.minute * 1) + (TimeInterval.second * 1) + (TimeInterval.nanosecond * 0)
        
        // When
        let result = dayTime - testInterval
        
        // Then
        let testDay = Day(year: 1984, month: 6, day: 14)
        let testTime = Time(hour: 22, minute: 58, second: 59, nanosecond: 0)
        let testDayTime = DayTime(day: testDay, time: testTime)
        XCTAssertEqual(testDayTime, result)
    }
    
    func testAddingDuration() {
        // Given
        let day = Day(year: 1984, month: 06, day: 23)
        let dayTime = DayTime(day: day, time: .midnight)
        let duration = Duration(weeks: 1, days: 1, hours: 1, minutes: 1, seconds: 1, nanoseconds: 0)
        
        // When
        let result = dayTime + duration
        
        // Then
        let testDay = Day(year: 1984, month: 7, day: 1)
        let testTime = Time(hour: 1, minute: 1, second: 1, nanosecond: 0)
        let testDayTime = DayTime(day: testDay, time: testTime)
        XCTAssertEqual(testDayTime, result)
    }
    
    func testSubtractingDuration() {
        // Given
        let day = Day(year: 1984, month: 06, day: 23)
        let dayTime = DayTime(day: day, time: .midnight)
        let duration = Duration(weeks: 1, days: 1, hours: 1, minutes: 1, seconds: 1, nanoseconds: 0)
        
        // When
        let result = dayTime - duration
        
        // Then
        let testDay = Day(year: 1984, month: 6, day: 14)
        let testTime = Time(hour: 22, minute: 58, second: 59, nanosecond: 0)
        let testDayTime = DayTime(day: testDay, time: testTime)
        XCTAssertEqual(testDayTime, result)
    }
    
    static var allTests = [
        ("testAddingTimeInterval", testAddingTimeInterval),
        ("testSubtractingTimeInterval", testSubtractingTimeInterval),
        ("testAddingDuration", testAddingDuration),
        ("testSubtractingDuration", testSubtractingDuration)
    ]
}
