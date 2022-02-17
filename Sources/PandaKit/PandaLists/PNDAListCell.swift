//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/17/22.
//

import Foundation
import UIKit

/// ListCell represents a cell that PNDAListHeaderController registers and degqueues for
/// list rendering. T represents the Class Type, usually a model or view model object, this cell
/// should render visually.
@available(iOS 13.0, tvOS 13.0, *)
open class PNDAListCell<T>: UICollectionViewCell {
    
    /// item is fed in automatically from PNDAListHeaderController
    open var item: T!
    
    /// parentController is et to be the PNDAListHeaderController that is rendering this cell. This is usefull
    /// for scenarios where a cell contains a Button and want to use "addTarget" to trigger an action
    /// in the controller
    open weak var parentController: UIViewController?
    
    /// A separator line to seaprate cells
    public let separatorView = UIView(backgroundColor: UIColor(white: 0.6, alpha: 0.5))
    
    /// This method sets up the separator line with some left padding
    open func addSeparatorView(leftPadding: CGFloat = 0) {
        addSubview(separatorView)
        separatorView.anchor(top: nil,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: .init(top: 0, left: leftPadding, bottom: 0, right: 0),
                             size: .init(width: 0, height: 0.5))
    }
    
    /// This method sets up the separator line to be anchored to some leading anchor
    open func addSeparatorView(leadingAnchor: NSLayoutXAxisAnchor) {
        addSubview(separatorView)
        separatorView.anchor(top: nil,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             size: .init(width: 0, height: 0.5))
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// In your custom cell classes, just override this method to provide custom behavior.
    open func setupViews() {}
    
    
}
