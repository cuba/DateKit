//
//  DurationTests.swift
//  DateKitTests
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import XCTest
@testable import DateKit

class DurationTests: XCTestCase {

    func testTimeInterval() {
        // Given
        let day = Day(year: 1984, month: 06, day: 23)
        let date = day.date(with: .midnight, in: .current)
        let duration = Duration(weeks: 1, days: 1, hours: 1, minutes: 1, seconds: 1, nanoseconds: 0)
        
        // When
        let timeInterval = duration.timeInterval
        
        // Then
        let testInterval = (TimeInterval.week * 1) + (TimeInterval.day * 1) + (TimeInterval.hour * 1) + (TimeInterval.minute * 1) + (TimeInterval.second * 1) + (TimeInterval.nanosecond * 0)
        XCTAssertEqual(timeInterval, testInterval)
        
        // Then 2
        let testDay = Day(year: 1984, month: 7, day: 1)
        let testTime = Time(hour: 1, minute: 1, second: 1, nanosecond: 0)
        let testDate = testDay.date(with: testTime, in: .current)
        XCTAssertEqual(testDate, date.addingTimeInterval(timeInterval))
    }
    
    func testAddDuration() {
        // Given
        var duration = Duration(weeks: 1, days: 1, hours: 1, minutes: 1, seconds: 1, nanoseconds: 0)
        let duration2 = Duration(weeks: 2, days: 2, hours: 2, minutes: 2, seconds: 2, nanoseconds: 0)
        
        // When
        duration.add(duration2)
        
        // Then
        let expected = Duration(weeks: 3, days: 3, hours: 3, minutes: 3, seconds: 3, nanoseconds: 0)
        XCTAssertEqual(duration, expected)
    }
    
    func testSubtractDuration() {
        // Given
        var duration = Duration(weeks: 1, days: 1, hours: 1, minutes: 1, seconds: 1, nanoseconds: 0)
        let duration2 = Duration(weeks: 2, days: 2, hours: 2, minutes: 2, seconds: 2, nanoseconds: 0)
        
        // When
        duration.subtract(duration2)
        
        // Then
        let expected = Duration(weeks: -1, days: -1, hours: -1, minutes: -1, seconds: -1, nanoseconds: 0)
        XCTAssertEqual(duration, expected)
    }
    
    func testAddingDuration() {
        // Given
        let duration1 = Duration(weeks: 1, days: 1, hours: 1, minutes: 1, seconds: 1, nanoseconds: 0)
        let duration2 = Duration(weeks: 2, days: 2, hours: 2, minutes: 2, seconds: 2, nanoseconds: 0)
        
        // When
        let result = duration1 + duration2
        
        // Then
        let expected = Duration(weeks: 3, days: 3, hours: 3, minutes: 3, seconds: 3, nanoseconds: 0)
        XCTAssertEqual(result, expected)
    }
    
    func testSubtractingDuration() {
        // Given
        let duration1 = Duration(weeks: 1, days: 1, hours: 1, minutes: 1, seconds: 1, nanoseconds: 0)
        let duration2 = Duration(weeks: 2, days: 2, hours: 2, minutes: 2, seconds: 2, nanoseconds: 0)
        
        // When
        let result = duration1 - duration2
        
        // Then
        let expected = Duration(weeks: -1, days: -1, hours: -1, minutes: -1, seconds: -1, nanoseconds: 0)
        XCTAssertEqual(result, expected)
    }
    
    static var allTests = [
        ("testTimeInterval", testTimeInterval),
        ("testAddDuration", testAddDuration),
        ("testSubtractDuration", testSubtractDuration),
        ("testAddingDuration", testAddingDuration),
        ("testSubtractingDuration", testSubtractingDuration)
    ]
}
