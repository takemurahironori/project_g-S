//
//  FirstViewController.swift
//  practice_screen2
//
//  Created by 竹村博徳 on 2020/07/04.
//  Copyright © 2020 竹村博徳. All rights reserved.


import UIKit
import XLPagerTabStrip

class FirstViewController: UIViewController,IndicatorInfoProvider {
    

    
    @IBOutlet weak var tableView: UITableView!
    //ここがボタンのタイトルに利用されます
    var itemInfo: IndicatorInfo = "For you"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableViewに背景画像を設定するコード
//         let imageView = UIImageView(frame: CGRect(x:0, y:0, width:self.tableView.frame.width, height:self.tableView.frame.height))
//         // read image
//         let image = UIImage(named: "editorpick.jpg")
//         // set image to ImageView
//         imageView.image = image
//         // set alpha value of imageView
//         imageView.alpha = 1.0
//         // set imageView to backgroundView of TableView
//         self.tableView.backgroundView = imageView
//

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier:"customTableViewCell")
        configureTableView()
        
        
    }

    
    
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10;
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! TableViewCell
        cell.title.text = "記念すべき最初の記事！"
        cell.articledetail.text = "皆さん始めまして！これからも投稿頑張っていくので応援してください！"
        
        
           return cell
       }
       
       func configureTableView() {
           tableView.rowHeight = 200
       }
    
    
    //XLPagerTabStripに必須
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
}


extension FirstViewController: UITableViewDataSource,UITableViewDelegate{}
