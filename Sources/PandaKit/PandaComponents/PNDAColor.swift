
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

public extension UIColor {
    static var cherryColor          = withRGBValue(229, 47, 47, a: 1)
    static var alizarinColor        = withRGBValue(231, 76, 60, a: 1)
    static var papayaColor          = withRGBValue(255, 161, 68, a: 1)
    static var sunFlowerColor       = withRGBValue(241, 196, 15, a: 1)
    static var nephritsColor        = withRGBValue(39, 174, 96, a: 1)
    static var greenSeaColor        = withRGBValue(22, 160, 133, a: 1)
    static var amethystColor        = withRGBValue(155, 89, 182, a: 1)
    static var wetAsphaltColor      = withRGBValue(52, 73, 94, a: 1)
    static var midnightBlueColor    = withRGBValue(44, 64, 80, a: 1)
    static var cloudColor           = withRGBValue(236, 240, 241, a: 1)
    static var darkCloudColor       = withRGBValue(28, 35, 37, a: 1)
    static var asbestosColor        = withRGBValue(127, 140, 141, a: 1)
    
    /// This method returns the provided color value divided by 255 to get the appropiate
    /// value that UIColor wants
    /// - Parameters:
    ///   - red: red value
    ///   - green: green value
    ///   - blue: blue value
    ///   - alpha: alpha value
    /// - Returns: returns the a UIColor object with the values divieded by 255 for accurate color use
    static func withRGBValue(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, a alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

/// PNDAColor is a subclass of UIColor. It provides some extra color functionality
open class PNDAColor: UIColor {
    override public convenience init() {
        self.init()
    }
    
    static var pandaDefaultColor: UIColor {
        if #available(iOS 13, *) {
            return UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return .darkCloudColor
                default:
                    return .cloudColor
                }
            }
        } else {
            return .cloudColor
        }
    }
}

extension PNDAColor {
    
    public func adjust(by percent: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * percent, alpha: a)
    }
}

