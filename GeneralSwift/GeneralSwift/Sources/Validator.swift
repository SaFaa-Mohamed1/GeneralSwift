//
//  Validator.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 25/01/2022.
//

import Foundation
public protocol ValidatorProtocol {
    /// validate  an email address is a valid  or not
    ///
    /// - Parameters:
    /// - email
    static func  isValidEmail(_ email : String) -> Bool
    static func isNumber(number : String) -> Bool
    static func isAlphabetAndWhitespace(number : String) -> Bool
    static func isAlphabet(number : String) -> Bool
    static func isDifferentPass(_ password:String, _ confirmPassword:String) -> Bool
    
}

 public struct validator : ValidatorProtocol{
    public static func isValidEmail(_ email : String) -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        let boolValue =  regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
        return  boolValue
    }
     public static func isNumber(number : String) -> Bool {
     
             return !number.isEmpty && number.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
         
     }
     public static func isAlphabetAndWhitespace(number : String) -> Bool {
         return number.range(of: ".*[^A-Za-z ].*", options: .regularExpression) == nil
     }
     
     public static func isAlphabet(number : String) -> Bool {
         return number.range(of: "[^A-Za-z]", options: .regularExpression) == nil
     }
    public static func isDifferentPass(_ password:String,
                                 _ confirmPassword:String) -> Bool
    {
        if (password == confirmPassword){
            return false
        } else {
            return true
        }
    }
    
    
}
