//
//  RecurrenceRule.swift
//
//  Created by Sisov Alexandr on 9/30/19.
//  Copyright © 2019 Sisov Alexandr. All rights reserved.
//

import EventKit

/// Represent recurrence rule model
struct RecurrenceRule {
    /// System calendar
    var calendar = Calendar.current
    /// Frequency of repeats
    var frequency: RecurrenceFrequency
    /// First day of week in rule
    var firstDayOfWeek: EKWeekday = .monday
    /// Initial date of events
    var startDate = Date()
    /// Times of repeat
    var interval = 1

    /// Represent when recurrency should end
    var recurrenceEnd: EKRecurrenceEnd?

    /// Array of positions to repeats
    var bysetpos: [Int] = []
    /// Array of years to repeats
    var byyearday: [Int] = []
    /// Array of months to repeats
    var bymonth: [Int] = []
    /// Array of weeks to repeats
    var byweekno: [Int] = []
    /// Array of month's days to repeats
    var bymonthday: [Int] = []
    /// Array of week's days to repeats
    var byweekday: [EKWeekday] = []
    /// Array of hours to repeats
    var byhour: [Int] = []
    /// Array of minutes to repeats
    var byminute: [Int] = []
    /// Array of seconds to repeats
    var bysecond: [Int] = []

    /// Inclusion date
    var rdate: InclusionDate?
    /// Exclusion date
    var exdate: ExclusionDate?
    
    /// String in recurrency rule format
    var rruleString: String {
        RRule.string(from: self)
    }

    init(frequency: RecurrenceFrequency) {
        self.frequency = frequency
    }

    init?(rruleString: String) {
        if let recurrenceRule = RRule.rule(from: rruleString) {
            self = recurrenceRule
        } else {
            return nil
        }
    }

}

extension RecurrenceRule {
    
    /// Frequency in string representation
    var unit: String {
        let isPlural = interval > 1
        
        switch frequency {
        case .monthly:  return isPlural ? "months" : "month"
        case .weekly:   return isPlural ? "weeks" : "week"
        case .daily:    return isPlural ? "days" : "day"
        case .hourly:   return isPlural ? "hours" : "hour"
        case .minutely: return isPlural ? "minutes" : "minute"
        default:
            return ""
        }
    }
    
}

