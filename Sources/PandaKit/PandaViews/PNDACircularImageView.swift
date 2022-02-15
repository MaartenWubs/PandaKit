//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/15/22.
//

import Foundation
import UIKit

@available(iOS 13.0, tvOS 13.0, *)
open class PNDACircularImageView: UIImageView {
 
    public init(width: CGFloat, image: UIImage? = nil ) {
        super.init(image: image)
        contentMode = .scaleAspectFill
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        clipsToBounds = true
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
}
