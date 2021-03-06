
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation
import UIKit

/// A list component where a header class is not required
///
/// ## Generics ##
/// -**T**: The cell type that this list will register and dequeue
/// -**U**: The item type that each cell will represent
@available(iOS 13.0, tvOS 13.0, *)
open class PNDAListController<T: PNDAListCell<U>, U>: PNDAListHeaderController<T, U, UICollectionReusableView> {
    
}
