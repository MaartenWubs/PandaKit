//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/15/22.
//

import Foundation
import UIKit

open class PNDAAspectFitImageView: UIImageView {
    
    convenience public init(image: UIImage? = nil, cornerRadius: CGFloat = 0) {
        self.init(image: image)
        self.layer.cornerRadius = cornerRadius
    }
    
    convenience public init() {
        self.init(image: nil)
    }
    
    public override init(image: UIImage?) {
        super.init(image: image)
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
}
