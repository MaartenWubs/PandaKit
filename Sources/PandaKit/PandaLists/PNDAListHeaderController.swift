//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/17/22.
//

import Foundation
import UIKit

/// PNDAListHeaderController helps register, dequeue, and set up cells with their
/// respective items to render in a standard single section list.
///
/// ## Generics ##
/// -**T**: The cell type that this list will register and dequeue
/// -**U:**: The item type that each cell will visually represent
/// -**H**: The header type above the scetion of cells.
@available(iOS 13.0, tvOS, *)
open class PNDAListHeaderController<T: PNDAListCell<U>, U,
                                    H: UICollectionReusableView>:
                                    PNDAListHeaderFooterController<T, U, H, UICollectionReusableView {
    
}
