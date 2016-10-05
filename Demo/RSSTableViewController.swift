//
//  RSSTableViewController.swift
//  XMLModelizer
//
//  Created by aoponaopon on 2016/09/24.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import UIKit
import WebKit
import XMLModelizer
import SDWebImage

class RSSTableViewController: UITableViewController {
    
    var models: [NSObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "RSSTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        models = XMLModelizer.modelize(modelClass: NYTimesArticle.self,
                                       urlString: "http://rss.nytimes.com/services/xml/rss/nyt/World.xml") as! [NYTimesArticle]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let model: NYTimesArticle = models[indexPath.row] as! NYTimesArticle
        let webViewController: UIViewController = WebViewController.instantiateWithStoryBoard()
        let webView: WKWebView = WKWebView(frame: webViewController.view.bounds)
        webViewController.view.addSubview(webView)
        webView.load(URLRequest(url: model.linkURL()!))
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RSSTableViewCell
        let model: NYTimesArticle = models[indexPath.row] as! NYTimesArticle
        cell.titleTextLabel.text = model.title.first
        cell.categoryLabel.text = model.category.first
        cell.pubDateLabel.text = model.formattedDate()
        cell.thumbImageView.sd_setImage(with: model.thumbImageURL())
        return cell
    }
    
}
