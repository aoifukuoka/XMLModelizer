//
//  ViewController.swift
//  Demo
//
//  Created by aoponaopon on 2016/09/22.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import UIKit
import XMLModelizer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let models: [NYTimesArticle] = XMLModelizer.modelize(modelClass: NYTimesArticle.self, urlString: "http://rss.nytimes.com/services/xml/rss/nyt/World.xml") as! [NYTimesArticle]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

