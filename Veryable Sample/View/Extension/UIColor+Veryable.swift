//
//  UIColor+Veryable.swift
//  Veryable Sample
//
//  Created by Pooja Kaluskar on 3/27/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func colorFromHexString(colorHex: String, alpha: CGFloat? = 1.0) -> UIColor {
        
        var hexInt: UInt32 = 0
        let scanner: Scanner = Scanner(string: colorHex)
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        scanner.scanHexInt32(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    class func vryBlue() -> UIColor {
        return UIColor.colorFromHexString(colorHex: "#2081C3")
    }
    
    class func vryGreen() -> UIColor {
        return UIColor.colorFromHexString(colorHex: "#68AAAB")
    }
    
    class func vryPurple() -> UIColor {
        return UIColor.colorFromHexString(colorHex: "#8C7AD9")
    }
    
    class func vryGreyDark() -> UIColor {
        return UIColor.colorFromHexString(colorHex: "#4A4A4A")
    }
    
    class func vryGrey() -> UIColor {
        return UIColor.colorFromHexString(colorHex: "#7E7E7E")
    }

    class func vryBackground() -> UIColor{
        return UIColor.colorFromHexString(colorHex: "#F1F5F6")
    }
    
}
