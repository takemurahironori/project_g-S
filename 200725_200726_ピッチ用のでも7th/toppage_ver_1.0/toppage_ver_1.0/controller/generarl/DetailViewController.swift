//
//  DetailViewController.swift
//  toppage_ver_1.0
//
//  Created by 竹村博徳 on 2020/07/19.
//  Copyright © 2020 竹村博徳. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var whisky: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var whiskyInfo: whiskyInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard  let whiskyInfo = whiskyInfo else {return}
        
        whisky.image = UIImage(named: whiskyInfo.whiskyicon)
        name.text = whiskyInfo.name
        descriptionLabel.text = whiskyInfo.description
    
    
    
    }
}

