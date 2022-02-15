//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/15/22.
//

import Foundation
import UIKit

open class PNDAAspectFillImageView: UIImageView {
    convenience public init() {
        self.init(image: nil)
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
