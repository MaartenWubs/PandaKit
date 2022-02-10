//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/10/22.
//

import Foundation
import UIKit

extension UIColor {
    static public func withRGBValue(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
            return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        }
}


