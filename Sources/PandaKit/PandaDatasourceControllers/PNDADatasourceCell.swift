
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// A single data item when that item is within the collection view's visible bounds.
open class PNDADatasourceCell: UICollectionViewCell {
    
    open var datasourceItem: Any?
    open weak var controller: PNDADatasourceController?
    
    public let separatorLineView: PNDAView = {
        let lineView = PNDAView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        lineView.isHidden = true
        return lineView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupView() {
        clipsToBounds = true
        addSubview(separatorLineView)
        separatorLineView.anchor(top: nil,
                                 leading: leadingAnchor,
                                 bottom: bottomAnchor,
                                 trailing: trailingAnchor,
                                 padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                 size: CGSize(width: 0, height: 0))
    }
}
