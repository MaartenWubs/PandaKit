
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

class PNDADefaultCell: PNDADatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            if let text = datasourceItem as? String {
                label.text = text
            } else {
                label.text = datasourceItem.debugDescription
            }
        }
    }
    
    let label = UILabel()
    
    override func setupView() {
        super.setupView()
        addSubview(label)
        label.anchor(top: topAnchor,
                     leading: leadingAnchor,
                     bottom: bottomAnchor,
                     trailing: trailingAnchor,
                     padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10),
                     size: CGSize(width: 0, height: 0))
    }
}

class PNDADefaultHeader: PNDADefaultCell {
    
    override var datasourceItem: Any? {
        didSet {
            if datasourceItem == nil {
                label.text = "This is your default header"
            }
        }
    }
    
    override func setupView() {
        super.setupView()
        label.text = "Header Cell"
        label.textAlignment = .center
    }
}

class PNDADefaultFooter: PNDADefaultCell {
    
    override var datasourceItem: Any? {
        didSet {
            if datasourceItem == nil {
                label.text = "This is your default footer"
            }
        }
    }
    
    override func setupView() {
        super.setupView()
        label.text = "Footer Cell"
        label.textAlignment = .center
    }
}
