
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//


import Foundation
import UIKit

/// AN UIImageView object that initializes with the provided Image to be sized to fill
/// into the view keeping its aspect.
open class PNDAAspectFillImageView: UIImageView {
    convenience public init() {
        self.init(image: nil)
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
