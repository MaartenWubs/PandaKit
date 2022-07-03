
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
public enum Anchor {
    case top(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case leading(_ top: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case bottom(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case trailing(_ top: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case heigh(_ constant: CGFloat = 0)
    case width(_ constant: CGFloat = 0)
}

//MARK: -Layout Extensions
@available(iOS 11.0, tvOS 11.0, *)
extension UIView {
    
    @discardableResult
    /// Set constraints for the specified acnhors
    /// - Parameter anchors: anchors needing constraints
    /// - Returns: A View with all the specified anchors set to the constraint
    public func anchor(_ anchors: Anchor...) -> PNDAAnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = PNDAAnchoredConstraints()
        anchors.forEach { anchor in
            switch anchor {
            case .top(let anchor, let constant):
                anchoredConstraints.top = topAnchor.constraint(equalTo: anchor, constant: constant)
            case .leading(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(equalTo: anchor, constant: constant)
            case .bottom(let anchor, let constant):
                anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
            case .trailing(let anchor, let constant):
                anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
            case .heigh(let constant):
                if constant > 0 {
                    anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
                }
            case .width(let constant):
                if constant > 0 {
                    anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
                }
            }
        }
        [anchoredConstraints.top,
         anchoredConstraints.leading,
         anchoredConstraints.bottom,
         anchoredConstraints.trailing,
         anchoredConstraints.width,
         anchoredConstraints.height].forEach {
            $0?.isActive = true
        }
        
        return anchoredConstraints
    }
    
    @discardableResult
    public func anchor(top: NSLayoutYAxisAnchor?,
                     leading: NSLayoutXAxisAnchor?,
                     bottom: NSLayoutYAxisAnchor?,
                     trailing: NSLayoutXAxisAnchor?,
                     padding: UIEdgeInsets = .zero,
                     size: CGSize = .zero) -> PNDAAnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = PNDAAnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top,
         anchoredConstraints.leading,
         anchoredConstraints.bottom,
         anchoredConstraints.trailing,
         anchoredConstraints.width,
         anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
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
    
    @discardableResult
    /// Scales the view to the fill the entire superview, with some padding if specified
    /// - Parameter padding: The amount of padding to the view
    /// - Returns: Returns the view scaled to fill the superview with some padding if specified.
    public func viewFillSuperview(padding: UIEdgeInsets = .zero) -> PNDAAnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        let anchoredConstraints = PNDAAnchoredConstraints()
        guard let superviewTopAnchor = superview?.topAnchor,
              let superviewLeadingAnchor = superview?.leadingAnchor,
              let superviewBottomAnchor = superview?.bottomAnchor,
              let superviewTrailingAnchor = superview?.trailingAnchor else {
                  return anchoredConstraints
              }
        
        return anchor(top: superviewTopAnchor,
                      leading: superviewLeadingAnchor,
                      bottom: superviewBottomAnchor,
                      trailing: superviewTrailingAnchor,
                      padding: padding)
    }

    @discardableResult
    /// Scales the view to fill the superview within the safe area of the device.
    /// - Parameter padding: Padding around the view.
    /// - Returns: Returns the view scaled to fill the superview within the safe area.
    public func viewFillSuperviewInSafeAreaLayoutGuide(padding: UIEdgeInsets = .zero) -> PNDAAnchoredConstraints {
        let anchoredConstraints = PNDAAnchoredConstraints()
        guard let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor,
              let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor,
              let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor,
              let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor else {
                  return anchoredConstraints
              }
        return anchor(top: superviewTopAnchor,
                      leading: superviewLeadingAnchor,
                      bottom: superviewBottomAnchor,
                      trailing: superviewTrailingAnchor,
                      padding: padding)
    }
    
    /// This method centers the view within the Superview.
    /// - Parameter size: This is the width and height of the view.
    public func centerViewInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    /// Centers the view to its X Anchor compared to the specified anchor in the parameter.
    /// - Parameter anchor: Anchor to set the views constraints to.
    public func centerViewXAnchorTo(_ anchor: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    /// Centers the view to its Y Anchor compared to the specified anchor in the parameter.
    /// - Parameter anchor: Anchor to set the views constraint to.
    public func centerViewYAnchorTo(_ anchor: NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    /// Cetners the view to the X Axis of the superview
    public func centerViewToXAxisOfSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
    }
    
    /// Centers the view to the Y Axis of the superview
    public func centerViewToYAxisOfSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
    }
    
    @discardableResult
    /// Sets the height constraint of the view its applied to.
    /// - Parameter constant: A CGFloat specifing the height of the view
    /// - Returns: The view with the specified height.
    public func constraintHeight(with constant: CGFloat) -> PNDAAnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraintes = PNDAAnchoredConstraints()
        anchoredConstraintes.height = heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraintes.height?.isActive = true
        return anchoredConstraintes
    }
    
    @discardableResult
    /// Sets the width constraint of the view its applied to.
    /// - Parameter constant: A CGFloat specifing the width of the view.
    /// - Returns: The view with the specified width.
    public func constraintWidth(with constant: CGFloat) -> PNDAAnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchortedConstraintes = PNDAAnchoredConstraints()
        anchortedConstraintes.width = widthAnchor.constraint(equalToConstant: constant)
        anchortedConstraintes.width?.isActive = true
        return anchortedConstraintes
    }
    
    /// Applies a shadow to the view its applied to.
    /// - Parameters:
    ///   - opacity: The opacity of the shadow.
    ///   - radius: The Radius of the shadow.
    ///   - offset: Shadow offset.
    ///   - color: The color of the shadow.
    public func setupViewShadow(opacity: Float = 0, radius: CGFloat = 0, offset: CGSize = .zero, color: UIColor = .black) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
    
    convenience public init(backgroundColor: UIColor = .clear) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
}

//MARK: -View Stacking
@available(iOS 11.0, tvOS 11.0, *)
extension UIView {
    
    fileprivate func _stackView(_ axis: NSLayoutConstraint.Axis = .vertical,
                                views: [UIView],
                                spacing: CGFloat = 0,
                                alignment: UIStackView.Alignment = .fill,
                                distrubution: UIStackView.Distribution = .fill) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distrubution
        addSubview(stackView)
        stackView.viewFillSuperview()
        return stackView
    }
    
    @discardableResult
    /// Creates a UIStackView with the provided views in a vertical configuration.
    /// - Parameters:
    ///   - views: The sub views for the UIStackView
    ///   - spacing: The amount of spacing between the arranged views in the UIStackView
    ///   - alignment: The layout of arranged views perpendicular to the UIStackView axis
    ///   - distribution: The size and position of the arranged views along the UIStackView axis
    /// - Returns: Returns the configured UIStackView
    public func VStackView(_ views: UIView...,
                    spacing: CGFloat = 0,
                    alignment: UIStackView.Alignment = .fill,
                    distribution: UIStackView.Distribution = .fill) -> UIStackView {
        
        return _stackView(.vertical, views: views, spacing: spacing, alignment: alignment, distrubution: distribution)
    }
    
    @discardableResult
    /// Creates a UIStackView with the provided views in a horizontal configuration
    /// - Parameters:
    ///   - views: The sub views for the UIStackView
    ///   - spacing: The amount of spacing between the arranged views in the UIStackView
    ///   - alignment: The layout of arranged views perpendicular to the UIStackView axis
    ///   - distribution: The size and position of the arranged views along the UIStackView axis
    /// - Returns: Returns the configured UIStackView
    public func HStackView(_ views: UIView...,
                    spacing: CGFloat = 0,
                    alignment: UIStackView.Alignment = .fill,
                    distribution: UIStackView.Distribution = .fill) -> UIStackView {
        
        return _stackView(.horizontal, views: views, spacing: spacing, alignment: alignment, distrubution: distribution)
    }
    
    @discardableResult
    /// This method can be used to set the size of the UIView
    /// - Parameter size: A CGSize specifing the size of the UIView
    /// - Returns: return the view
    public func withSize<T: UIView>(_ size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    @discardableResult
    /// This method can be used to set the height of the UIView
    /// - Parameter height: A CGFloat that specifies the height of the View
    /// - Returns: Returns the view with the specified height
    public func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    /// This method can be used to set the width of the UIView
    /// - Parameter width: A CGFloat that specifies the width of the View
    /// - Returns: Returns the view with the specified width
    public func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    /// This method sets a border around the UIView
    /// - Parameters:
    ///   - lineWidth: A CGFloat specifing the line width of the border
    ///   - color: A UIColor that specifies the color of the border
    /// - Returns: Returns the configured view.
    public func withBorder<T: UIView>(lineWidth: CGFloat, color: UIColor) -> T {
        layer.borderWidth = lineWidth
        layer.borderColor = color.cgColor
        return self as! T
    }
}
