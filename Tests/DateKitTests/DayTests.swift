//
//  DayTests.swift
//  DateKitTests
//
//  Created by Jacob Sikorski on 2019-01-05.
//

import XCTest
@testable import DateKit

class DayTests: XCTestCase {

    func testValidYearMonthAndDay_DayIsCreated() {
        // Given
        let year = 1984
        let month = 6
        let day = 23
        
        // When
        let testDay = Day(year: year, month: month, day: day)
        
        // Then
        XCTAssertEqual(testDay.year, 1984)
        XCTAssertEqual(testDay.month, 6)
        XCTAssertEqual(testDay.day, 23)
    }
    
    func testYearIsNegative_DayIsCreated() {
        // Given
        let year = -1984
        let month = 6
        let day = 23
        
        // When
        let testDay = Day(year: year, month: month, day: day)
        
        // Then
        XCTAssertEqual(testDay.year, 1985)
        XCTAssertEqual(testDay.month, 6)
        XCTAssertEqual(testDay.day, 23)
    }
    
    func testMonthLargerThan12_DayIsCreated() {
        // Given
        let year = 1984
        let month = 13
        let day = 23
        
        // When
        let testDay = Day(year: year, month: month, day: day)
        
        // Then
        XCTAssertEqual(testDay.year, 1985)
        XCTAssertEqual(testDay.month, 1)
        XCTAssertEqual(testDay.day, 23)
    }
    
    func testMonthIsNegative_DayIsCreated() {
        // Given
        let year = 1984
        let month = -6
        let day = 23
        
        // When
        let testDay = Day(year: year, month: month, day: day)
        
        // Then
        XCTAssertEqual(testDay.year, 1983)
        XCTAssertEqual(testDay.month, 6)
        XCTAssertEqual(testDay.day, 23)
    }
    
    func testDayLargerThan31_DayIsCreated() {
        // Given
        let year = 1984
        let month = 06
        let day = 32
        
        // When
        let testDay = Day(year: year, month: month, day: day)
        
        // Then
        XCTAssertEqual(testDay.year, 1984)
        XCTAssertEqual(testDay.month, 7)
        XCTAssertEqual(testDay.day, 2)
    }
    
    func testDayIsNegative_DayIsCreated() {
        // Given
        let year = 1984
        let month = 6
        let day = -23
        
        // When
        let testDay = Day(year: year, month: month, day: day)
        
        // Then
        XCTAssertEqual(testDay.year, 1984)
        XCTAssertEqual(testDay.month, 5)
        XCTAssertEqual(testDay.day, 8)
    }
    
    func testDayCanBeCreatedFromDate() {
        // Given
        let components = DateComponents(calendar: .current, timeZone: .current, year: 1984, month: 6, day: 23)
        let date = components.date!
        
        // When
        let testDay = Day(from: date, in: .current)
        
        // Then
        XCTAssertEqual(testDay.year, 1984)
        XCTAssertEqual(testDay.month, 6)
        XCTAssertEqual(testDay.day, 23)
    }
    
    func testDayCanBeConvertedToDate() {
        // Given
        let components = DateComponents(calendar: .current, timeZone: .current, year: 1984, month: 6, day: 23)
        let date = components.date!
        let day = Day(from: date, in: .current)
        
        // When
        let testDate = day.date(with: .midnight, in: .current)
        
        // Then
        XCTAssertEqual(date, testDate)
    }
    
    func testDayCanBeConvertedToDateWithTheTimeSpecified() {
        // Given
        let date = Date()
        let day = Day(from: date, in: .current)
        let time = Time(from: date, in: .current)
        
        // When
        let testDate = day.date(with: time, in: .current)
        
        // Then
        XCTAssertEqual(date, testDate)
    }
    
    func testDayCanStripOutTime() {
        // Given
        let date = Date()
        let day = Day(from: date, in: .current)
        
        // When
        let result = day.date(with: .midnight, in: .current)
        
        // Then
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, year: components.year, month: components.month, day: components.day, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let testDate = newComponents.date!
        XCTAssertEqual(testDate, result)
    }
    
    func testAddingDays() {
        // Given
        let day = Day(year: 1984, month: 6, day: 23)
        let days = 1000
        
        // When
        let result = day + days
        
        // Then
        let testDay = Day(year: 1987, month: 3, day: 19)
        XCTAssertEqual(testDay, result)
    }
    
    func testSubtractingDays() {
        // Given
        let day = Day(year: 1984, month: 6, day: 23)
        let days = 1000
        
        // When
        let result = day - days
        
        // Then
        let testDay = Day(year: 1981, month: 9, day: 27)
        XCTAssertEqual(testDay, result)
    }
    
    func testNextDay() {
        // Given
        let day = Day(year: 1984, month: 6, day: 23)
        
        // When
        let result = day.nextDay
        
        // Then
        let testDay = Day(year: 1984, month: 6, day: 24)
        XCTAssertEqual(testDay, result)
    }
    
    func testPreviousDay() {
        // Given
        let day = Day(year: 1984, month: 6, day: 23)
        
        // When
        let result = day.previousDay
        
        // Then
        let testDay = Day(year: 1984, month: 6, day: 22)
        XCTAssertEqual(testDay, result)
    }
    
    static var allTests = [
        ("testValidYearMonthAndDay_DayIsCreated", testValidYearMonthAndDay_DayIsCreated),
        ("testYearIsNegative_DayIsCreated", testYearIsNegative_DayIsCreated),
        ("testMonthLargerThan12_DayIsCreated", testMonthLargerThan12_DayIsCreated),
        ("testMonthIsNegative_DayIsCreated", testMonthIsNegative_DayIsCreated),
        ("testDayLargerThan31_DayIsCreated", testDayLargerThan31_DayIsCreated),
        ("testDayIsNegative_DayIsCreated", testDayIsNegative_DayIsCreated),
        ("testDayCanBeCreatedFromDate", testDayCanBeCreatedFromDate),
        ("testDayCanBeConvertedToDate", testDayCanBeConvertedToDate),
        ("testDayCanBeConvertedToDateWithTheTimeSpecified", testDayCanBeConvertedToDateWithTheTimeSpecified),
        ("testDayCanStripOutTime", testDayCanStripOutTime),
        ("testAddingDays", testAddingDays),
        ("testSubtractingDays", testSubtractingDays),
        ("testNextDay", testNextDay),
        ("testPreviousDay", testPreviousDay)
    ]
}
