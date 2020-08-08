//
//  TableViewCell.swift
//  genaral_librarty2
//
//  Created by 竹村博徳 on 2020/07/10.
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
