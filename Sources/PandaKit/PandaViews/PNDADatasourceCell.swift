
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
                                 bottom: bottomAnchor,
                                 left: leftAnchor,
                                 right: rightAnchor,
                                 topConstant: 0,
                                 bottomConstant: 0,
                                 leftConstant: 0,
                                 rightConstant: 0,
                                 widthConstant: 0,
                                 heightConstant: 0.5)
    }
}
