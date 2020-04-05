//
//  UIColor+Extension.swift
//  InstaClone
//
//  Created by Philip Martin on 05/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import UIKit

extension UIColor{
    class func colourStringWitHex(hexColour hex: String, withAlpha: CGFloat) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return .black
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(withAlpha)
        )
    }
}
