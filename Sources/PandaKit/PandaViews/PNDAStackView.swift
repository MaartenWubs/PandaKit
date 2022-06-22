
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

@available(iOS 13.0, tvOS 13.0, *)
extension UIStackView {
    
    @discardableResult
    public func withMargin(_ margins: UIEdgeInsets) -> UIStackView {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    public func paddingLeft(_ left: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = left
        return self
    }
    
    @discardableResult
    public func paddingTop(_ top: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = top
        return self
    }
    
    @discardableResult
    public func paddingRight(_ right: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = right
        return self
    }
    
    @discardableResult
    public func paddingBottom(_ bottom: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = bottom
        return self
    }
}
