
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

open class PNDAButton: UIButton {
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupView() {
    }
    
}

extension PNDAButton {
    
    static public func systemButton(title: String? = nil,
                                    image: PNDAImage? = nil,
                                    titleColor: UIColor = .white,
                                    font: UIFont? = nil,
                                    target: Any? = nil,
                                    selector: Selector? = nil) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setImage(image?.withRenderingMode(.alwaysOriginal),
                        for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        if let selector = selector {
            button.addTarget(target, action: selector, for: .touchUpInside)
        }
        return button
    }
}
