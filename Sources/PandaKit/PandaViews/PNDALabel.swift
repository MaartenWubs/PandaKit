
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// A view that displays one or more lines of informational text.
open class PNDALabel: UILabel {
    
    public init(text: String? = nil, font: UIFont? = nil) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PNDALabel {
    
}
