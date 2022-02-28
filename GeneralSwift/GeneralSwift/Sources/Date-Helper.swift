//
//  DateHelper.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 24/02/2022.
//

import Foundation

public protocol DateHelperProtocol {
    static func getCurrentDate(dateformate : String) -> String
    static func getStringDate(date: Date, dateformate : String) -> String
    static func getCurrentTime() -> String
    static func getDifferenceTimes(time1Str: String, time2Str: String) -> String
    
    
}
public struct DateHelper : DateHelperProtocol {
    /// get current date
    public static func getCurrentDate(dateformate : String) -> String{
     let date = Date()
     let formatter = DateFormatter()
     formatter.dateFormat = dateformate
     let result = formatter.string(from: date)
     
     return result
 }
    /// get date as string
   public static func getStringDate(date: Date,
                                    dateformate : String) -> String
   {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dateformate
        let result = formatter.string(from: date)
        
        return result
    }
    /// get curren time
   public static func getCurrentTime() -> String
   {
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "hh:mm:ss"
        let result = formatter.string(from: date)
        
        return result
    }
    /// get difference between two times
  public static func getDifferenceTimes(time1Str: String,
                                        time2Str: String) -> String
  {
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "hh:mm a"

        guard let time1 = timeformatter.date(from: time1Str),
            let time2 = timeformatter.date(from: time2Str) else { return "" }


        let interval = time2.timeIntervalSince(time1)
        let hour = interval / 3600;
        let minute = interval.truncatingRemainder(dividingBy: 3600) / 60
        let intervalInt = Int(interval)
        return "\(intervalInt < 0 ? "-" : "+") \(Int(hour)) Hours \(Int(minute)) Minutes"
    }
}
