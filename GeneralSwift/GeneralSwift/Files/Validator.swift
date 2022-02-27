//
//  Validator.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 25/01/2022.
//

import Foundation
public struct validator {
    public static func validEmail(_ email : String) -> Bool {
   
let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        let boolValue =  regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
      return  boolValue
    }
   public static func isDifferentPass(_ password:String, _ confirmPassword:String) -> Bool {
            if (password == confirmPassword){
                return false
            } else {
                return true
            }
        }
    
    public static func valid() -> String{
       return "Email is valid"
    }
}
