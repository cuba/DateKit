//
//  TimeTests.swift
//  DateKitTests
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import XCTest
@testable import DateKit

class TimeTests: XCTestCase {

    func testValidHourMinuteSecondAndNanosecond_TimeIsCreated() {
        // Given
        let hour = 12
        let minute = 15
        let second = 30
        let nanosecond = 450
        
        // When
        let testTime = Time(hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        
        // Then
        XCTAssertEqual(testTime.hour, 12)
        XCTAssertEqual(testTime.minute, 15)
        XCTAssertEqual(testTime.second, 30)
        XCTAssertEqual(testTime.nanosecond, 450)
    }
    
    func testHourIsNegative_TimeIsCreated() {
        // Given
        let today = Day.today
        let time = Time(hour: -6, minute: 15, second: 30, nanosecond: 0)
        
        // When
        let date = time.date(with: today, in: .current)
        let testTime = Time(from: date, in: .current)
        let testDate = testTime.date(with: today.previousDay, in: .current)
        
        // Then
        print(date)
        print(testDate)
        XCTAssertEqual(date, testDate)
        XCTAssertNotEqual(time, testTime)
        XCTAssertEqual(testTime.hour, 18)
        XCTAssertEqual(testTime.minute, 15)
        XCTAssertEqual(testTime.second, 30)
        XCTAssertEqual(testTime.nanosecond, 0)
    }
    
    func testMinuteIsNegative_TimeIsCreated() {
        // Given
        let today = Day.today
        let time = Time(hour: 12, minute: -15, second: 30, nanosecond: 450)
        
        // When
        let date = time.date(with: today, in: .current)
        let testTime = Time(from: date, in: .current)
        let testDate = testTime.date(with: today, in: .current)
        
        // Then
        XCTAssertEqual(date, testDate)
    }
    
    func testSecondIsNegative_TimeIsCreated() {
        // Given
        let today = Day.today
        let time = Time(hour: 12, minute: 30, second: -15, nanosecond: 450)
        
        // When
        let date = time.date(with: today, in: .current)
        let testTime = Time(from: date, in: .current)
        let testDate = testTime.date(with: today, in: .current)
        
        // Then
        XCTAssertEqual(date, testDate)
    }
    
    func testNanosecondIsNegative_TimeIsCreated() {
        // Given
        let today = Day.today
        let time = Time(hour: 12, minute: 30, second: 15, nanosecond: -450)
        
        // When
        let date = time.date(with: today, in: .current)
        let testTime = Time(from: date, in: .current)
        let testDate = testTime.date(with: today, in: .current)
        
        // Then
        XCTAssertEqual(date, testDate)
    }
    
    static var allTests = [
        ("testValidHourMinuteSecondAndNanosecond_TimeIsCreated", testValidHourMinuteSecondAndNanosecond_TimeIsCreated),
        ("testHourIsNegative_TimeIsCreated", testHourIsNegative_TimeIsCreated),
        ("testMinuteIsNegative_TimeIsCreated", testMinuteIsNegative_TimeIsCreated),
        ("testSecondIsNegative_TimeIsCreated", testSecondIsNegative_TimeIsCreated),
        ("testNanosecondIsNegative_TimeIsCreated", testNanosecondIsNegative_TimeIsCreated)
    ]
}
