//
//  DDXMLNode+Ancestor.swift
//  XMLModelizer
//
//  Created by aoponaopon on 2016/10/05.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import Foundation
import KissXML

extension DDXMLNode {
    
    open func isAncestorOf(node: DDXMLNode) -> Bool {
        return node.isDescendantOf(node: self)
    }
    
    open func isDescendantOf(node: DDXMLNode) -> Bool {
        
        if self.parent == nil {
            return false
        }
        if self.parent == node {
            return true
        }else {
            return (self.parent?.isDescendantOf(node: node))!
        }
    }
}
