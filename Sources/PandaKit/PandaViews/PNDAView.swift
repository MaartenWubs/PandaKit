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
    public func anchor(top: NSLayoutYAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       left: NSLayoutXAxisAnchor? = nil,
                       right: NSLayoutXAxisAnchor? = nil,
                       topConstant: CGFloat = 0,
                       bottomConstant: CGFloat = 0,
                       leftConstant: CGFloat = 0,
                       rightConstant: CGFloat = 0,
                       widthConstant: CGFloat = 0,
                       heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        _ = anchorWithReturnAnchors(top: top,
                                    left: left,
                                    bottom: bottom,
                                    right: right,
                                    topConstant: topConstant,
                                    leftConstant: leftConstant,
                                    bottomConstant: bottomConstant,
                                    rightConstant: rightConstant,
                                    widthConstant: widthConstant,
                                    heightConstant: heightConstant)
    }
    
    public func anchorWithReturnAnchors(top: NSLayoutYAxisAnchor? = nil,
                                        left: NSLayoutXAxisAnchor? = nil,
                                        bottom: NSLayoutYAxisAnchor? = nil,
                                        right: NSLayoutXAxisAnchor? = nil,
                                        topConstant: CGFloat = 0,
                                        leftConstant: CGFloat = 0,
                                        bottomConstant: CGFloat = 0,
                                        rightConstant: CGFloat = 0,
                                        widthConstant: CGFloat = 0,
                                        heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top,
                                                constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left,
                                                 constant: leftConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom,
                                                   constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right,
                                                  constant: -rightConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        anchors.forEach({$0.isActive = true})
        return anchors
    }
}
