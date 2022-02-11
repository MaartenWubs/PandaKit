
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// An object that manages the content for a rectangular area on the screen.
open class PNDAView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Override this methods to configure the view.
    open func setupView() {
    }
}

extension PNDAView {

}
