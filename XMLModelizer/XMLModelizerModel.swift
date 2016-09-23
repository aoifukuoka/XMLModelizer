//
//  XMLModelizerModel.swift
//  XMLModelizer
//
//  Created by aoponaopon on 2016/09/22.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import UIKit

open class XMLModelizerModel: NSObject {
    
    var _title: String!
    var _link: String!
    var _guid: String!
    var _description: String!
    
    open class func xmlModelizerXpathKeyMap() -> [String:String] {
        return [
            "_title":"//item/title",
            "_link":"//item/link",
            "_guid":"//item/guid",
            "_description":"//item/description",
        ]
    }
    
    open class var classProperties: [String] {
        var resultSet: [String] = []
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self, &count)
        
        for i in 0..<Int(count) {
            let propName = String(utf8String: property_getName(properties?[i]))
            resultSet.append(propName!)
        }
        return resultSet
    }

}
