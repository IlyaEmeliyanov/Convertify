//
//  Extensions.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 06/09/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    func fromHexToUIColor(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.popLast()
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat((rgb & 0x0000FF)) / 255.0, alpha: 1.0)
        
    }

    func fromHexToRGB(hex: [String]) -> String {
        let red = UInt8("\(hex[0]+hex[1])", radix: 16)
        let green = UInt8("\(hex[2]+hex[3])", radix: 16)
        let blue = UInt8("\(hex[4]+hex[5])", radix: 16)
        
        return "\(String(describing: red!)) \(String(describing: green!)) \(String(describing: blue!))"
    }
    
    func fromRGBToHex(r: Int, g: Int, b: Int) -> String {
        let red = String(format:"%02X", r)
        let green = String(format:"%02X", g)
        let blue = String(format:"%02X", b)
        
        return "\(red + green + blue)"
    }
    
}
