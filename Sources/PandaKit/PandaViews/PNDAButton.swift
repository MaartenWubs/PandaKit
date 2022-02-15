
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// A control that executes custom code in response to user interactions.
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
                                    image: UIImage? = nil,
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

//MARK: -UIButton Extension
@available(iOS 13.0, tvOS 13.0, *)
extension UIButton {
    
    convenience public init(title: String,
                            titleColor: UIColor,
                            font: UIFont = .systemFont(ofSize: 14),
                            backgroundColor: UIColor = .clear,
                            target: Any? = nil,
                            action: Selector? = nil) {
        
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        
        self.backgroundColor = backgroundColor
        if let action = action {
            addTarget(target, action: action, for: .primaryActionTriggered)
        }
    }
    
    convenience public init(image: UIImage,
                            tintColor: UIColor? = nil,
                            target: Any? = nil,
                            action: Selector? = nil) {
        
        self.init(type: .system)
        if tintColor == nil {
            setImage(image, for: .normal)
        } else {
            setImage(image.withRenderingMode(.alwaysTemplate),
                     for: .normal)
            self.tintColor = tintColor
        }
        
        if let action = action {
            addTarget(target, action: action, for: .primaryActionTriggered)
        }
    }
}
