//
//  TableViewCell.swift
//  practice_screen2
//
//  Created by 竹村博徳 on 2020/08/14.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var icon: UIImageView!
    
    
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var articledetail: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
