//
//  CollectionViewCell.swift
//  toppage_ver_1.0
//
//  Created by 竹村博徳 on 2020/07/19.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
//    @IBOutlet weak var dateLabel: UILabel!
//    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 12
        
    
    }
    
    

    
}
