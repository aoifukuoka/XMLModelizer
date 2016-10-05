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

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @available(iOS 2.0, *)
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    @IBOutlet var urlSelect: UIPickerView!
    var pickerDataSource = ["NYTimes", "Petmd", "Elle"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlSelect.delegate = self
        urlSelect.dataSource = self
    }

    @IBAction func nextButtonDidTapped(_ sender: AnyObject) {
        let rssTableViewController: RSSTableViewController = RSSTableViewController.instantiateWithStoryBoard()
        rssTableViewController.theme = pickerDataSource[urlSelect.selectedRow(inComponent: 0)]
        self.navigationController?.pushViewController(rssTableViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
}

