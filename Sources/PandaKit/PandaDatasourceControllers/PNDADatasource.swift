
//===----------------------------------------------------------------------===//
//
// This source file is part of the PandaKit project
//
// Copyright (c) 2022 Maarten Wubs
//
//===----------------------------------------------------------------------===//

import Foundation

/// PNDADatasource is the object that provides the PNDADatasourceController with the information
/// it needs to render out a list. Override the methods to provide a custom implementation of what
/// cells, header or footers your list should render.
open class PNDADatasource: NSObject {
    
    public var objects: [Any]?
    
    /// The cell that will be used to render out the list.
    /// - Returns: The provided cell class
    public func cellClasses() -> [PNDADatasourceCell.Type] {
        return []
    }
    
    /// This method can be used to give more specific details to the cell.
    /// - Parameter indexPath: the cell at the specified place
    /// - Returns: The adjusted cell
    public func cellClass(_ indexPath: IndexPath) -> PNDADatasourceCell.Type? {
        return nil
    }
    
    /// This method provides the header used for the list
    /// - Returns: The rendered out header.
    public func headerClasses() -> [PNDADatasourceCell.Type]? {
        return []
    }
    
    /// This method provides a footer to the list.
    /// - Returns: The rendered out footer.
    public func footerClasses() -> [PNDADatasourceCell.Type]? {
        return []
    }
    
    /// This method takes in the section en renders ou the list with the right amount of cells
    /// - Parameter section: section to be rendered
    /// - Returns: the amount of items in the list
    public func numberOfItems(_ section: Int) -> Int {
        return objects?.count ?? 0
    }
    
    /// This method renders the the sections of the list
    /// - Returns: the amount of sections of the list.
    public func numberOfSections() -> Int {
        return 1
    }
    
    /// For each row in the list, override this to provide it with a specific
    /// item. Access this in your PNDADatasourceCell by overrideing
    /// datasourceItem.
    /// - Parameter indexPath: the cell at the specified index
    /// - Returns: returns the content of the input item.
    public func item(_ indexPath: IndexPath) -> Any? {
        return objects?[indexPath.item]
    }
    
    /// This method returns the header specialization.
    /// - Parameter section: section number
    /// - Returns: return the content of the header.
    public func headerItem(_ section: Int) -> Any? {
        return nil
    }
    
    /// This method returns the footer specialization.
    /// - Parameter section: section number
    /// - Returns: returns the content of the footer
    public func footerItem(_ section: Int) -> Any? {
        return nil
    }
}
