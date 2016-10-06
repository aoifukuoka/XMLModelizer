//
//  NYTimesArticle.swift
//  XMLModelizer
//
//  Created by aoponaopon on 2016/09/22.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import UIKit
import XMLModelizer

class NYTimesArticle: XMLModelizerModel {
    
    var title: [String]!
    var link: [String]!
    var media: [String]!
    var category: [String]!
    var pubDate: [String]!
    
    override class func xmlModelizerXpathKeyMap() -> [String:String] {
        return [
            "title":"//item/title",
            "link":"//item/link",
            "media":"//item/media:content/@url",
            "category":"//item/category",
            "pubDate":"//item/pubDate",
        ]
    }
    
    // MARK: Custom functions
    
    open func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        let date = formatter.date(from: self.pubDate.first!)
        formatter.dateFormat = "EEE, dd MMM yyyy"
        return formatter.string(from: date!)
    }
    
    open func thumbImageURL() -> URL? {
        
        if self.media.count == 0 {
            return nil
        }
        return URL(string: self.media.first!)
    }
    
    open func linkURL() -> URL? {
        
        if self.link.count == 0 {
            return nil
        }
        return URL(string: self.link.first!)
    }
}
