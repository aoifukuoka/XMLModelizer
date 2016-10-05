//
//  ViewController.swift
//  Demo
//
//  Created by aoponaopon on 2016/09/22.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import UIKit
import XMLModelizer
import AFSheme

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backgroud color
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [
            UIColor(red:0.87, green:0.68, blue:0.27, alpha:1).cgColor,
            UIColor(red:0.89, green:0.54, blue:0.72, alpha:1).cgColor,
        ]
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func nextButtonDidTapped(_ sender: AnyObject) {
        let rssTableViewController: RSSTableViewController = RSSTableViewController.instantiateWithStoryBoard()
        self.navigationController?.pushViewController(rssTableViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

