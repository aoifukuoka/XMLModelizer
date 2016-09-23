//
//  XMLModelizer.swift
//  XMLModelizer
//
//  Created by aoponaopon on 2016/09/22.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import UIKit
import KissXML

open class XMLModelizer: NSObject {
    
    open static func modelize(modelClass: XMLModelizerModel.Type, urlString: String) -> [AnyObject] {
        
        if urlString == "" {
            return []
        }
        
        let url: URL = URL(string: urlString)!
        return self.modenize(modelClass: modelClass, url: url)
    }
    
    open static func modenize(modelClass: XMLModelizerModel.Type, url: URL) -> [AnyObject] {
        let xmlData: Data! = try? Data(contentsOf: url)
        return self.modenize(modelClass: modelClass, xmlData: xmlData)
    }
    
    open static func modenize(modelClass: XMLModelizerModel.Type, xmlData: Data) -> [AnyObject] {
        
        if !modelClass.isSubclass(of: XMLModelizerModel.self) {
            return []
        }
        if !modelClass.responds(to: #selector(XMLModelizerModel.xmlModelizerXpathKeyMap)) {
            return []
        }
        
        var propertyValues :[String:[String]] = [:]
        do {
            let document: DDXMLDocument! = try? DDXMLDocument.init(data: xmlData as Data, options: 0)
            for (key, xpath) in modelClass.xmlModelizerXpathKeyMap() {
                let values: [String] = try document.nodes(forXPath: xpath).map{(($0 as DDXMLNode).stringValue!)}
                propertyValues[key] = values
            }
        } catch {
            return []
        }
        
        var resultSet: [AnyObject] = []
        let modelCount: Int = propertyValues[Array(propertyValues.keys).first!]!.count
        for i in 0..<modelCount {
            let model = (modelClass as NSObject.Type).init()
            for (property, values) in propertyValues {
                if modelClass.classProperties.contains(property) {
                    model.setValue(values[i], forKey: property)
                }
            }
            resultSet.append(model)
        }
        return resultSet
    }
}
