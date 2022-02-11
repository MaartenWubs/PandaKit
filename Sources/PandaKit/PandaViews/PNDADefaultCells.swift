
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
    
    let label = PNDALabel()
    
    override func setupView() {
        super.setupView()
        addSubview(label)
        label.anchor(top: topAnchor,
                     bottom: bottomAnchor,
                     left: leftAnchor,
                     right: rightAnchor,
                     topConstant: 0,
                     bottomConstant: 0,
                     leftConstant: 10,
                     rightConstant: 10,
                     widthConstant: 0,
                     heightConstant: 0)
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
