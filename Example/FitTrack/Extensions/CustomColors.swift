//
//  CustomColors.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 20.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

import UIKit

extension UIColor {
    
    static func runActivityColor() -> UIColor {
        return generateColor(255.0, green: 80.0, blue: 163.0, alpha: 1)
    }
    
    static func caloriesActivityColor() -> UIColor {
        return generateColor(255.0, green: 117.0, blue: 31.0, alpha: 1)
    }
    
    static func distanceActivityColor() -> UIColor {
        return generateColor(80.0, green: 185.0, blue: 255.0, alpha: 1)
    }
    
    static func bikeActivityColor() -> UIColor {
        return generateColor(13.0, green: 202.0, blue: 172.0, alpha: 1)
    }
    
    static func sleepActivityColor() -> UIColor {
        return generateColor(111.0, green: 58.0, blue: 255.0, alpha: 1)
    }
    
    static func activeSegmentButtonFontBackgroundColor() -> UIColor {
        return generateColor(149.0, green: 121.0, blue: 229.0, alpha: 1)
    }
    
    static func headerSectionBackgroundColor() -> UIColor {
        return generateColor(117.0, green: 90.0, blue: 204.0, alpha: 1)
    }
    
    static func navigationBarBackgroundColor() -> UIColor {
        return generateColor(104.0, green: 75.0, blue: 195.0, alpha: 1)
    }
    
    static func generateColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
}