
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// PNDAListHeaderController helps register, dequeue, and set up cells with their
/// respective items to render in a standard single section list.
///
/// ## Generics ##
/// -**T**: The cell type that this list will register and dequeue
/// -**U:**: The item type that each cell will visually represent
/// -**H**: The header type above the scetion of cells.
@available(iOS 13.0, tvOS 13.0, *)
open class PNDAListHeaderController<T: PNDAListCell<U>, U,
                                    H: UICollectionReusableView>:
                                    PNDAListHeaderFooterController<T, U, H, UICollectionReusableView> {
    
}
