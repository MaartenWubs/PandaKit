//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/10/22.
//

import Foundation
import UIKit

open class PNDADatasourceController: UICollectionViewController,
                                UICollectionViewDelegateFlowLayout {
    
    public let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .UIActivityIndicatorView.Style.large)
        aiv.hidesWhenStopped = true
        aiv.color = UIColor.black
        return aiv
    }()
    
    open var datasource: PNDADatasource? {
        didSet {
            if let cellClasses = datasource?.cellClasses() {
                for cellClass in cellClasses {
                    collectionView.register(cellClass,
                                            forCellWithReuseIdentifier: NSStringFromClass(cellClass))
                }
            }
            
            if let headerClasses = datasource?.headerClasses() {
                for headerClass in headerClasses {
                    collectionView.register(headerClass,
                                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                            withReuseIdentifier: NSStringFromClass(headerClass))
                }
            }
            
            if let footerClasses = datasource?.footerClasses() {
                for footerClass in footerClasses {
                    collectionView.register(footerClass,
                                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                            withReuseIdentifier: NSStringFromClass(footerClass))
                }
            }
            collectionView?.reloadData()
        }
    }
    
    public init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let defaultIDForCell = "PandaKitCellID"
    let defaultIDForFooter = "PandaKitFooterID"
    let defaultIDForHeader = "PandaKitHeaderID"
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.setAnchorCenterXToSuperview()
        activityIndicatorView.setAnchorCenterYToSuperview()
    }
}
