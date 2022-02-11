
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

extension UIView {
    
    /// This methods can be used to set constraints with a visual layout. This is a shorter method based upon
    /// NSLayoutConstraint.
    ///
    /// - **Usage**:
    ///     - view.addConstraintsWithFormat("H:|-16-[v0(44)]-16-|", views: someView)
    ///
    /// - Parameters:
    ///   - format: string representing the view layout
    ///   - views: subviews to be set in the view layout
    public func addConstraintsWithFormat(_ format: String, views: UIView...) {
            var viewsDict = [String: UIView]()
            for (index, view) in views.enumerated() {
                let key = "v\(index)"
                view.translatesAutoresizingMaskIntoConstraints = false
                viewsDict[key] = view
            }
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                          options: NSLayoutConstraint.FormatOptions(),
                                                          metrics: nil,
                                                          views: viewsDict))
        }
    
    /// This method sets the applied view to the x center of the superview
    /// - Parameter constant: the amount to off center the view will be
    public func setAnchorCenterXToSuperview(withConstant constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    /// This method sets the applied view to the x center of the superview
    /// - Parameter constant: the amount to off center the view will be
    public func setAnchorCenterYToSuperview(withConstant constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    /// This method sets the applied view to the center of the superview
    public func setAnchorCenterToSuperview() {
        setAnchorCenterXToSuperview()
        setAnchorCenterYToSuperview()
    }
    
    /// This method sets the anchors to all specified sides
    /// - Parameters:
    ///   - top: Top anchor
    ///   - bottom: Bottom anchor
    ///   - left: Left anchor
    ///   - right: Right anchor
    ///   - topConstant: Top constant
    ///   - bottomConstant: Bottom Constant
    ///   - leftConstant: Left constant
    ///   - rightConstant: Right constant
    ///   - widthConstant: Width constant
    ///   - heightConstant: Height constant
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
    
    private func anchorWithReturnAnchors(top: NSLayoutYAxisAnchor? = nil,
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

