//
//  Log+Extensions.swift
//  SwiftLog
//
//  Created by Andrew on 04.10.2021.
//

import Foundation

extension Log {
    
    internal static func time(date: Date = Date(), style: Log.LogStyle = .short) -> String {
        let df = DateFormatter()
        switch style {
        case .full:
            df.dateFormat = "HH:mm:ss.SSS"
        case .short:
            df.dateFormat = "HH:mm:ss.SSS"
        }
        return df.string(from: date)
    }
}
