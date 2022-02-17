
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//
import Foundation
import UIKit

/// PNDADatasourceController is simply a UICollectioViewController that allows quick creation of
/// list views. In order to render out the items in the list, provide it with a PNDADatasource object.
@available(iOS 13.0, tvOS 13.0, *)
open class PNDADatasourceController: UICollectionViewController,
                                     UICollectionViewDelegateFlowLayout {
    
    public let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        aiv.hidesWhenStopped = true
        aiv.color = UIColor.black
        return aiv
    }()
    
    /// The provided PNDADatasource object.
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
        
        collectionView?.register(PNDADefaultCell.self,
                                 forCellWithReuseIdentifier: defaultIDForCell)
        collectionView?.register(PNDADefaultHeader.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: defaultIDForHeader)
        collectionView?.register(PNDADefaultFooter.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                 withReuseIdentifier: defaultIDForFooter)
    }
    
    open override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datasource?.numberOfSections() ?? 0
    }
    
    open override func collectionView(_ collectionView: UICollectionView,
                                      numberOfItemsInSection section: Int) -> Int {
        return datasource?.numberOfItems(section) ?? 0
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    /// Returns the cell that corresponds to the item at the specified index path in the
    /// PNDADatasourceController
    /// - Parameters:
    ///   - collectionView: The PNDADatasourceController requesting this information
    ///   - indexPath: The index path that specifies the location of the item
    /// - Returns: A configured PNDADatasourceCell object.
    open override func collectionView(_ collectionView: UICollectionView,
                                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: PNDADatasourceCell
        
        if let cls = datasource?.cellClass(indexPath) {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cls),
                                                      for: indexPath) as! PNDADatasourceCell
        } else if let cellClasses = datasource?.cellClasses(), cellClasses.count > indexPath.section {
            let cls = cellClasses[indexPath.section]
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cls),
                                                      for: indexPath) as! PNDADatasourceCell
        } else if let cls = datasource?.cellClasses().first {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cls),
                                                      for: indexPath) as! PNDADatasourceCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultIDForCell,
                                                      for: indexPath) as! PNDADatasourceCell
        }
        
        cell.controller = self
        cell.datasourceItem = datasource?.item(indexPath)
        return cell
    }
    
    /// Returns a supplementary view for the specified element kind to display in the
    /// PNDADatasourceController view.
    /// - Parameters:
    ///   - collectionView: The PNDADatasourceController requesting this information
    ///   - kind: The kind of supplementary view to provide. The value of this string is defined by the layout object that supports the supplementary view.
    ///   - indexPath: The index path that specifies the location of the new supplementary view
    /// - Returns: A configured supplementary view object.
    open override func collectionView(_ collectionView: UICollectionView,
                                      viewForSupplementaryElementOfKind kind: String,
                                      at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView: PNDADatasourceCell
        
        if kind == UICollectionView.elementKindSectionHeader {
            if let classes = datasource?.headerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: NSStringFromClass(classes[indexPath.section]),
                                                                               for: indexPath) as! PNDADatasourceCell
            } else if let cls = datasource?.headerClasses()?.first {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: NSStringFromClass(cls),
                                                                               for: indexPath) as! PNDADatasourceCell
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: defaultIDForHeader,
                                                                               for: indexPath) as! PNDADatasourceCell
            }
        } else {
            if let classes = datasource?.footerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: NSStringFromClass(classes[indexPath.section]),
                                                                               for: indexPath) as! PNDADatasourceCell
            } else if let cls = datasource?.footerClasses()?.first {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: NSStringFromClass(cls),
                                                                               for: indexPath) as! PNDADatasourceCell
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: defaultIDForFooter,
                                                                               for: indexPath) as! PNDADatasourceCell
            }
            reusableView.datasourceItem = datasource?.footerItem(indexPath.section)
        }
        
        reusableView.controller = self
        return reusableView
    }
    
    open func getRefreshControl() -> UIRefreshControl {
        let rc = UIRefreshControl()
        rc.addTarget(self,
                     action: #selector(handleRefresh), for: .valueChanged)
        return rc
    }
    
    @objc
    open func handleRefresh() {
    }
    
    open var layout: UICollectionViewFlowLayout? {
        get {
            return collectionViewLayout as? UICollectionViewFlowLayout
        }
    }
}
