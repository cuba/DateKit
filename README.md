DateKit
============

Add extra date functionality for objects that do not represent a timestamp.

[![Swift 4.2](https://img.shields.io/badge/swift-4.2-lightgrey.svg?style=for-the-badge)](https://swift.org)
[![Vapor 3](https://img.shields.io/badge/vapor-3-lightgrey.svg?style=for-the-badge)](https://vapor.codes)
![iOS 8](https://img.shields.io/badge/iOS-8-lightgrey.svg?style=for-the-badge)
![Carthage](https://img.shields.io/badge/carthage-compatible-green.svg?style=for-the-badge)
![SPM](https://img.shields.io/badge/SPM-compatible-green.svg?style=for-the-badge)
[![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg?style=for-the-badge)](https://github.com/cuba/DateKit/blob/master/LICENSE)

[![Build](https://img.shields.io/travis/cuba/DateKit/master.svg?style=for-the-badge)](https://travis-ci.org/cuba/DateKit)

- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)
- [Credits](#credits)
- [License](#license)

## Features

- [x] Date representations without timezone
- [x] Easy integration
- [x] Easily convert to and from framwork `Date` objects
- [x] Uses swift 4.2
- [x] Supports iOS 8 and up
- [x] Carthage support
- [x] SPM support

## Usage

For the full documentation, click here: https://cuba.github.io/DateKit/

### Import `DateKit`

Add the following to the top of any swift file using `MapCodableKit`
```swift
import DateKit 
```

### Day (Local Date)

`Day` (also known as "Local Date") represents an object containing the year, month and day components in a calendar.

TODO: Examples

### Time (Local Time)

`Time`  (also known as "Local Time") object represents an object containing the hour, minute and second and nanosecond components in a calendar.

Since time is circular (starts at 0 and ends back at 0), time is not comparable as 3am may be larger than 9am.  To compare time we need more information (such as the day).

TODO: Examples

### DayTime (Local Date Time)

`DayTime` (also known as "Local Date Time") object represents an object containing the year, month and day, hour, minute, second and nanosecond components in a calendar. Its a convenience grouping of `Day` and `Time` object.

TODO: Examples

### Duration

Duration represents time passed (or time that will pass) in weeks, days and hours, minutes, seconds and nanoseconds. It provides a way to represent date components that can be converted to a time interval without knowing the reference date.

Years, and months are not supported as they cannot be converted to a time interval without knowing a reference date and time zone. The reason for this is because the length of a month or year (in seconds) changes depending on the reference date. Leap years, for example, are shorter in seconds than non-leap years and a single month may be between 28 days (i.e. February) to 31 days (ex: December).

TODO: Examples

## Installation

### Package Manager

Package manager is a powerful packaging tool built into xcode.  For the full documentation on how to use package manager, click [here](https://swift.org/package-manager/)

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate `DateKit` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "cuba/DateKit" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `MapCodableKit.framework` into your Xcode project.

## Dependencies

`Framework` is the only dependency 😁

## Credits

`DateKit` is owned and maintained by Jacob Sikorski.

## License

`DateKit` is released under the MIT license. [See LICENSE](https://github.com/cuba/DateKit/blob/master/LICENSE) for details.

