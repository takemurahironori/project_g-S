//
//  TimelineTableViewController.swift
//  TimelineTableViewCell
//
//  Created by Zheng-Xiang Ke on 2016/10/20.
//  Copyright © 2016年 Zheng-Xiang Ke. All rights reserved.
//

import UIKit
import TimelineTableViewCell

class TimelineTableViewController: UITableViewController {
    
    // TimelinePoint, Timeline back color, title, description, lineInfo, thumbnails, illustration, whisky_icon
    let data:[Int: [(TimelinePoint, UIColor, String, String, String?, [String]?, String?,String?)]] =
        [0:[
            (TimelinePoint(), UIColor.black, "2020/07/05", "オクトモア", nil, nil, "check","12"),
            (TimelinePoint(), UIColor.black, "2020/06/05", "アードベック", nil, nil, "check","13"),
            (TimelinePoint(), UIColor.clear, "2020/05/05", "グレンドロナック", nil, nil, "check","14"),
            (TimelinePoint(), UIColor.clear, "2020/04/05", "", nil, nil, "",""),
            (TimelinePoint(), UIColor.black, "2020/03/05", "オーヘットシャン", nil, nil, "check","15"),
            (TimelinePoint(), UIColor.black, "2020/02/05", "", nil, nil, "",""),
            (TimelinePoint(), UIColor.clear, "2020/01/05", "マッカラン", nil, nil, "check","16"),],
                                                                                               
        1:[(TimelinePoint(), UIColor.clear, "2019/12/05", "", nil, nil, "",""),
           (TimelinePoint(), UIColor.clear, "2019/12/05", "グレンフィディック", nil, nil, "check","17"),
            ]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell", bundle: Bundle(for: TimelineTableViewCell.self))
        self.tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        #warning("ヘッダーの表示年数の変更。セクションの数で引き算する。最終的には文字で返す")
        return String(2019  - Int(section - 1))
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell

        // Configure the cell...
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnails, illustration,whisky_icon) = sectionData[indexPath.row]
        var timelineFrontColor = UIColor.clear
        if (indexPath.row > 0) {
            timelineFrontColor = sectionData[indexPath.row - 1].1
        }
        cell.timelinePoint = timelinePoint
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = timelineBackColor
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.lineInfoLabel.text = lineInfo
        
        
        if let thumbnails = thumbnails {
            cell.viewsInStackView = thumbnails.map { thumbnail in
                return UIImageView(image: UIImage(named: thumbnail))
            }
        }
        else {
            cell.viewsInStackView = []
        }
        
        if let illustration = illustration {
            cell.illustrationImageView.image = UIImage(named: illustration)
            #warning("変更した部分。追加したいwhisky_iconを追加")
            cell.whisky_icon.image = UIImage(named: whisky_icon!)
        }
        else {
            cell.illustrationImageView.image = nil
            #warning("変更した部分。追加したいwhisky_iconを追加")
            cell.whisky_icon.image = nil
        }
   
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionData = data[indexPath.section] else {
            return
        }
        
        print(sectionData[indexPath.row])
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

