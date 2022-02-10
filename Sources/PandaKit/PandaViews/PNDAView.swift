//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/10/22.
//

import Foundation
import UIKit

open class PNDAView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupView() {
    }
}

extension PNDAView {
    
}
