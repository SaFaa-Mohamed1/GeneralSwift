//
//  DateExtentions.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 24/02/2022.
//

import Foundation
public protocol DateProtocol
{
    func years(from date: Date) -> Int
    func months(from date: Date) -> Int
    func weeks(from date: Date) -> Int
    func days(from date: Date) -> Int
    func hours(from date: Date) -> Int
    func minutes(from date: Date) -> Int
    func seconds(from date: Date) -> Int
    func increaseDateBy(days: Int) -> Date
    func compare(date : Date) -> ComparisonResult
    func offset(from date: Date) -> String
    
}
extension Date : DateProtocol{
    /// Returns the amount of years from another date
   public func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
   public func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    public func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    public func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    public func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    public func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    public func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the date after increase date  by days
    public func increaseDateBy(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day,
                                     value: days,
                                     to: self) ?? Date()
    }
    
   public func compare(date : Date) -> ComparisonResult {
        Calendar.current.compare(self, to: date, toGranularity: .day)
    }
    /// Returns the a custom time interval description from another date
   public func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
}
