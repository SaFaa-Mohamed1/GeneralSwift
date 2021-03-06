//
//  Colors.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 24/02/2022.
//

import UIKit
public protocol HelperProtocol {
    static func hexStringToUIColor (hex:String) -> UIColor
    static func getMobDevSerial() -> String
    static func checkTextIsEmpty(txt: String)
}
public struct Helper {
    public static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6)
        {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
   public static func getMobDevSerial() -> String{
        let strUUID = UIDevice.current.identifierForVendor!.uuidString
        let deviceID = strUUID.replacingOccurrences(of: "-", with: "")
         print("deviceID",deviceID)
        return deviceID
    }
   public static func checkTextIsEmpty(txt: String) -> Bool {
        if txt.isEmpty || txt == "" {
            return true
        } else {
            return false
        }
    }
}
