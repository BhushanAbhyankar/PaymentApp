//
//  Utilites.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 09/05/21.
//

import Foundation
import UIKit

class Utilites {
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
         return UIColor(
             red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
             alpha: CGFloat(1.0)
         )
     }
}
