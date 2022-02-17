
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// An UIImageView object that initializes with the provided Image to be sized to fit
/// into the view keeping its aspect.
open class PNDAAspectFitImageView: UIImageView {
    
    convenience public init(image: UIImage? = nil, cornerRadius: CGFloat = 0) {
        self.init(image: image)
        self.layer.cornerRadius = cornerRadius
    }
    
    convenience public init() {
        self.init(image: nil)
    }
    
    public override init(image: UIImage?) {
        super.init(image: image)
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
}
