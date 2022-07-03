
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// PNDAListHeaderFooterController helps register, dequeue, and sets up cells with their respective item to
/// render in a standard single section list.
///
/// ## Generics ##
/// - **T** : the cell type that this list will register and dequeue.
/// - **U**: the item type that each cell will visually represent.
/// - **H**: The header type above the section of cells.
/// - **F**: The footer type below the section of cells.

@available(iOS 13.0, tvOS 13.0, *)
open class PNDAListHeaderFooterController<T: PNDAListCell<U>, U,
                                          H: UICollectionReusableView,
                                          F: UICollectionReusableView>:
                                            UICollectionViewController {
    
    /// An array of U objects this list will render. When using item.append, you
    /// still need to menually call reloadData.
    open var items = [U]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    fileprivate let cellID = "cellID"
    fileprivate let supplementaryID = "supplementaryViewID"
    
    /// Return an estimated height for proper indexPath using systemLayoutSizeFitting.
    open func estimatedHeightOfCell(for indexPath: IndexPath, withcellWidth width: CGFloat) -> CGFloat {
        let cell = T()
        let bigHeight: CGFloat = 1000
        cell.frame = .init(x: 0, y: 0, width: width, height: bigHeight)
        cell.item = items[indexPath.item]
        cell.layoutIfNeeded()
        
        return cell.systemLayoutSizeFitting(.init(width: width, height: bigHeight)).height
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
#if os(iOS)
        
        collectionView.backgroundColor = .systemBackground
        
#endif
        
        collectionView.register(T.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(H.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryID)
        collectionView.register(F.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: supplementaryID)
    }
    
    /// PNDAListHeaderController automatically dequeues your T cell and sets the correct item object on it.
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! T
        cell.item = items[indexPath.item]
        cell.parentController = self
        return cell
    }
    
    /// Override the following methods to setup your header and footer
    open func setupHeaderCell(_ header: H) {}
    open func setupFooterCell(_ footer: F) {}
    
    open override func collectionView(_ collectionView: UICollectionView,
                                      viewForSupplementaryElementOfKind kind: String,
                                      at indexPath: IndexPath) -> UICollectionReusableView {
        
        let suppView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                       withReuseIdentifier: supplementaryID,
                                                                       for: indexPath)
        if let header = suppView as? H {
            setupHeaderCell(header)
        } else if let footer = suppView as? F {
            setupFooterCell(footer)
        }
        return suppView
    }
    
    open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    open override func collectionView(_ collectionView: UICollectionView,
                                      willDisplaySupplementaryView view: UICollectionReusableView,
                                      forElementKind elementKind: String,
                                      at indexPath: IndexPath) {
        view.layer.zPosition = -1
    }
    
    /// Initializes your list with a plain UICollectionViewFlowLayout.
    ///
    /// ## Parameters ##
    ///-**Layout**: use the layout you want i.e. UICollectionViewFlowLayout
    ///-**scrollDirection**: the direction that your cells will be rendered
    public init(layout: UICollectionViewLayout = UICollectionViewFlowLayout(), scrollDirection: UICollectionView.ScrollDirection = .vertical) {
        if let layout = layout as? UICollectionViewFlowLayout {
            layout.scrollDirection = scrollDirection
        }
        super.init(collectionViewLayout: layout)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
