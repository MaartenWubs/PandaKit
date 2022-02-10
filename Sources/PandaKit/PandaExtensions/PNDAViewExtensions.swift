//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/10/22.
//

import Foundation
import UIKit

extension UIView {
    
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
    
    public func setAnchorCenterXToSuperview(withConstant constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func setAnchorCenterYToSuperview(withConstant constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func setAnchorCenterToSuperview() {
        setAnchorCenterXToSuperview()
        setAnchorCenterYToSuperview()
    }
}

