//
//  TableViewCell.swift
//  toppage_ver_1.0
//
//  Created by 竹村博徳 on 2020/07/19.
//  Copyright © 2020 竹村博徳. All rights reserved.
//



import UIKit


class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var whisky: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
        
        // Configure the view for the selected state
    }
   
    
    
    
}
