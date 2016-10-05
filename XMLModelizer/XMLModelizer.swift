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
        
        let document: DDXMLDocument! = try? DDXMLDocument.init(data: xmlData as Data, options: 0)
        var resultSet: [AnyObject] = []
        
        for (key, xpath) in modelClass.xmlModelizerXpathKeyMap() {
            var xpathElements: [String] = xpath.components(separatedBy: "/").filter{$0 != ""}
            if xpathElements.count == 1 {
                
            }else if(xpathElements.count > 1){
                
                let topLevelElements: [DDXMLNode]! = try? document.nodes(forXPath: "//" + xpathElements.removeFirst())
                let newXpath: String = "//" + xpathElements.joined(separator: "/")
                for topLevelElement in topLevelElements {
                    
                    //create if not exists
                    let idx = topLevelElements.index(of: topLevelElement)
                    if !resultSet.indices.contains(idx!) {
                        let model = (modelClass as NSObject.Type).init()
                        resultSet.append(model)
                    }
                    
                    let values = try? topLevelElement.nodes(forXPath: newXpath)
                    let resultValue: [String] = (values?
                        .filter{$0.isDescendantOf(node: topLevelElement)})!
                        .map{$0.stringValue!}
                    
                    if modelClass.classProperties.contains(key) {
                        (resultSet[idx!] as! XMLModelizerModel).setValue(resultValue, forKey: key)
                    }
                }
            }
        }
        return resultSet
    }
}
