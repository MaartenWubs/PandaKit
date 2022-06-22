
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// An object that displays a single image or a sequence of animated images in the interface.
open class PNDAImageView: UIImageView {
    open var shouldUseEmptyImage = true
    
    private var urlStringForChecking: String?
    private var emptyImage: UIImage?
    
    /// A convenient way to load an cache images.
    public static let imageCache = NSCache<NSString, PNDADiscardableImageCacheItem>()

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var tapCallback: (() ->())?
    
    public init(cornerRadius: CGFloat = 0, emptyImage: UIImage? = nil) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        self.emptyImage = emptyImage
    }
}

extension PNDAImageView {
    
    public convenience init(cornerRadius: CGFloat = 0, tapCallback: @escaping (() ->())) {
        self.init(cornerRadius: cornerRadius, emptyImage: nil)
        self.tapCallback = tapCallback
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc
    func handleTap() {
        tapCallback?()
    }
    
    /// Easily load an image from a URL string and cache it to reduce network overhead.
    /// - Parameters:
    ///   - urlString: The url location of your image
    ///   - completion: Optionally execute some task after the image download completes
    public func loadImage(urlString: String, completion: (() -> ())? = nil) {
        image = nil
        self.urlStringForChecking = urlString
        let urlKey = urlString as NSString
        
        if let cachedItem = PNDAImageView.imageCache.object(forKey: urlKey) {
            image = cachedItem.image
            completion?()
            return
        }
        
        guard let url = URL(string: urlString) else {
            if shouldUseEmptyImage {
                image = emptyImage
            }
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    let cacheItem = PNDADiscardableImageCacheItem(image: image)
                    PNDAImageView.imageCache.setObject(cacheItem, forKey: urlKey)
                    
                    if urlString == self?.urlStringForChecking {
                        self?.image = image
                        completion?()
                    }
                }
            }
        }).resume()
    }
}

//MARK: -UIImageView Extension
extension UIImageView {
    convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init(image: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
}
