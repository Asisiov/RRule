//
//  RecurrenceFrequency.swift
//
//  Created by Sisov Alexandr on 9/30/19.
//  Copyright © 2019 Sisov Alexandr. All rights reserved.
//

import Foundation

/// Enum of frequency.
enum RecurrenceFrequency: String, Codable {
    /// Frequency by years
    case yearly   = "YEARLY"
    /// Frequency by months
    case monthly  = "MONTHLY"
    /// Frequency by weeks
    case weekly   = "WEEKLY"
    /// Frequency by days
    case daily    = "DAILY"
    /// Frequency by hours
    case hourly   = "HOURLY"
    /// Frequency by minutes
    case minutely = "MINUTELY"
    /// Frequency by seconds
    case secondly = "SECONDLY"

    /**
     Function convert string to 'RecurrenceFrequency' enum.
     - Parameters:
     - string: string representation of frequency.
     - Returns: an instance of 'RecurrenceFrequency' or nil.
     */
    static func frequency(from string: String) -> RecurrenceFrequency? {
        switch string {
        case "SECONDLY": return .secondly
        case "MINUTELY": return .minutely
        case "HOURLY":   return .hourly
        case "DAILY":    return .daily
        case "WEEKLY":   return .weekly
        case "MONTHLY":  return .monthly
        case "YEARLY":   return .yearly
        default: return nil
        }
    }
}
