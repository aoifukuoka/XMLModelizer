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
    
    override class func xmlModelizerXpathKeyMap() -> [String:String] {
        return [
            "title":"//item/title",
            "link":"//item/link",
            "media":"//item/media:content/@url"
        ]
    }
}
