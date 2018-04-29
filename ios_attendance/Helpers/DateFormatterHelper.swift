//
//  DateFormatter.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 27/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import Foundation

extension Formatter {
    // Ex : Formatter.iso8601.string(from: Date())
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
}
