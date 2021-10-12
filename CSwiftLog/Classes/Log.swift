//
//  Log.swift
//  SwiftLog
//
//  Created by Andrew on 05.10.2021.
//

import Foundation

extension Log {
    
    // Default categories
    public static let ui = Log(category: "UI")
    public static let network = Log(category: "NETWORK")
    
    public enum LogType: String {
        case error      = "📕"
        case warning    = "📙"
        case success    = "📗"
        case info       = "📘"
        case canceled   = "📓"
    }
    
    public enum LogStyle {
        case full
        case short
    }
    
}

public class Log {
    
    private var category: String? = nil
    
    public init(category: String) {
        self.category = category
    }
    
    // MARK: With category
    #if DEBUG
    public func log(
        tag: String? = nil,
        _ message: String,
        _ type: LogType = .info,
        style: LogStyle = .short,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    )  {
        Log.log(tag: tag, message, type, style: style, category: self.category, file: file, function: function, line: line)
    }
    #else
    public func log(tag: String? = nil, _ message: String, _ type: LogType = .info, style: LogStyle = .short) {}
    #endif
    
    // MARK: Not category
    #if DEBUG
    public static func log(
        tag: String? = nil,
        _ message: String,
        _ type: LogType = .info,
        style: LogStyle = .short,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    )  {
        log(tag: tag, message, type, style: style, category: nil, file: file, function: function, line: line)
    }
    #else
    public static func log(tag: String? = nil, _ message: String, _ type: LogType = .info, style: LogStyle = .short) {}
    #endif
    
    // MARK: Main Log
    #if DEBUG
    private static func log(
        tag: String? = nil,
        _ message: String,
        _ type: LogType = .info,
        style: LogStyle = .short,
        category: String? = nil,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        // Add time
        var printString = time(style: style)
        // Add Type icon
        printString.append(" \(type.rawValue)")
        // Add fileName|line|function
        switch style {
        case .full:
            let fileName = (file as NSString).lastPathComponent
            printString.append(" [\(fileName): \(line)] \(function) ==>")
        case .short:
            printString.append(" ==>")
        }
        // Add category & tag
        if let category = category, let tag = tag {
            printString.append(" [\(category)/\(tag)]")
        } else if let category = category {
            printString.append(" [\(category)]")
        } else if let tag = tag {
            printString.append(" [\(tag)]")
        }
        // Add message
        printString.append(" \(message)")
        
        print(printString)
    }
    #endif
    
}
