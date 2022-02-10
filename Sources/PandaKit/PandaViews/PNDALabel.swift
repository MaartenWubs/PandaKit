//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/10/22.
//

import Foundation
import UIKit

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
