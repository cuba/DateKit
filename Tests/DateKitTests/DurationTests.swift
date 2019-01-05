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
    
    static var allTests = [
        ("testTimeInterval", testTimeInterval)
    ]
}
