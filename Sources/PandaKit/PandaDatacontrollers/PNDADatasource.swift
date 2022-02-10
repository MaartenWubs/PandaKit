//
//  File.swift
//  
//
//  Created by Maarten Wubs on 2/10/22.
//

import Foundation

open class PNDADatasource: NSObject {
    
    public var objects: [Any]?
    
    open func cellClasses() -> [PNDADatasourceCell.Type] {
        return []
    }
    
    open func cellClass(_ indexPath: IndexPath) -> PNDADatasourceCell.Type? {
        return nil
    }
    
    open func headerClasses() -> [PNDADatasourceCell.Type]? {
        return []
    }
    
    open func footerClasses() -> [PNDADatasourceCell.Type]? {
        return []
    }
    
    open func numberOfItems(_ section: Int) -> Int {
        return objects?.count ?? 0
    }
    
    open func numberOfSections() -> Int {
        return 1
    }
    
    open func item(_ indexPath: IndexPath) -> Any? {
        return objects?[indexPath.item]
    }
    
    open func headerItem(_ section: Int) -> Any? {
        return nil
    }
    
    open func footerItem(_ section: Int) -> Any? {
        return nil
    }
}
