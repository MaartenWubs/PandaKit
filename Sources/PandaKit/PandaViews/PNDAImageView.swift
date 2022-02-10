//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/10/22.
//

import Foundation
import UIKit

open class PNDAImageView: UIImageView {
    public init() {
    }
}

extension PNDAImageView {
    
    public static let imageCache = NSCache<NSString, PNDADiscardableImageCacheItem>()
    
    open var shouldUseEmptyImage = true
    
    private var urlStringForChecking: String?
    private var emptyImage: PNDAImage?
}
