
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// PNDAColor is a subclass of UIColor. It provides some extra color functionality
open class PNDAColor: UIColor {
    override public convenience init() {
        self.init()
    }
    
    /// This method returns the provided color value divided by 255 to get the appropiate
    /// value that UIColor wants
    /// - Parameters:
    ///   - red: red value
    ///   - green: green value
    ///   - blue: blue value
    ///   - alpha: alpha value
    /// - Returns: returns the a UIColor object with the values divieded by 255 for accurate color use
    static public func withRGBValue(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, a alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension PNDAColor {
    
}

