# CSwiftLog

[![Version](https://img.shields.io/cocoapods/v/CSwiftLog.svg?style=flat)](https://cocoapods.org/pods/CSwiftLog)
[![License](https://img.shields.io/cocoapods/l/CSwiftLog.svg?style=flat)](https://cocoapods.org/pods/CSwiftLog)
[![Platform](https://img.shields.io/cocoapods/p/CSwiftLog.svg?style=flat)](https://cocoapods.org/pods/CSwiftLog)

## Usage

```swift
Log.log("Message text without category")
Log.my.log("Message text with custom category")
Log.network.log("Message text with network category")

Log.ui.log("Message text simple")
Log.ui.log(tag: "TAG", "Message text with tag")
Log.ui.log(tag: "TAG", "Message text with not default type", .success)
Log.ui.log(tag: "TAG", "Message text with full form style", .error, style: .full)

Log.ui.log("Success type", .success, style: .full)
Log.ui.log("Into type", .info, style: .full)
Log.ui.log("Error type", .error, style: .full)
Log.ui.log("Warning type", .warning, style: .full)
Log.ui.log("Canceled type", .canceled, style: .full)
```
![alt text](https://github.com/andrewfirsenko/CSwiftLog/blob/master/Images/example.png?raw=true)

Add your category:

```swift
extension Log {
    
    static let my = Log(category: "MY_CATEGORY")
    static let model = Log(category: "MODEL")
    
}
```

Enum cases:
```swift
enum LogType: String {
    case error      = "📕"
    case warning    = "📙"
    case success    = "📗"
    case info       = "📘"
    case canceled   = "📓"
}

enum LogStyle {
    case full
    case short
}
```

## Installation

CSwiftLog is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CSwiftLog'
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Andrew Firsenko, [t.me/andrewfirsenko](https://t.me/andrewfirsenko)

## License

CSwiftLog is available under the MIT license. See the LICENSE file for more info.
