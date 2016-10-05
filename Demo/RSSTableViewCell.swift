//
//  RSSTableViewCell.swift
//  XMLModelizer
//
//  Created by aoponaopon on 2016/09/25.
//  Copyright © 2016年 aoponapopon. All rights reserved.
//

import UIKit

class RSSTableViewCell: UITableViewCell {

    @IBOutlet var titleTextLabel: UILabel!
    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var pubDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleTextLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
