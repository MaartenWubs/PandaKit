//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/11/22.
//

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
