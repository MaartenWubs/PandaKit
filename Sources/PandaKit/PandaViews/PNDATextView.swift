
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//


import Foundation
import UIKit

extension UITextView {
    convenience public init(text: String?,
                            font: UIFont? = UIFont.systemFont(ofSize: 14),
                            textColor: UIColor = .black,
                            textAlignment: NSTextAlignment = .left) {
        
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
    }
}

extension UITextField {
    convenience public init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
}
