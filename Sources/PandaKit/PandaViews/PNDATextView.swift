//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/11/22.
//

import Foundation
import UIKit

open class PNDATextView: UITextView {
    
    public init() {
        super.init(frame: .zero, textContainer: nil)
        backgroundColor = .clear
        isEditable = false
        isScrollEnabled = false
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PNDATextView {
    
}
