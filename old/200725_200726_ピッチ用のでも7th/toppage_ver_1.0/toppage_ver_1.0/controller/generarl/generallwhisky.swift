
//
//  generallwhisky.swift
//  toppage_ver_1.0
//
//  Created by 竹村博徳 on 2020/07/19.
//  Copyright © 2020 竹村博徳. All rights reserved.
//
import UIKit

class GenerallwhiskyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   
    let group :[[whiskyInfo]] = [
        [whiskyInfo(area:"0",whiskyicon:"01", name:"アベラワー", description:"バニラのような甘みを感じる美味しい銘柄！"),
    whiskyInfo(area:"0",whiskyicon:"02", name:"クラガンモア", description:"風味の複雑さが別格！飲みやすいだけじゃない、スパイシーさがウリ！"),
    whiskyInfo(area:"0",whiskyicon:"03", name:"グレンエルギン", description:"癖がなく飲みやすいウイスキー"),
    whiskyInfo(area:"0",whiskyicon:"04", name:"グレングラント", description:"風味は強くなく、サッパリとして飲みやすい！"),
    whiskyInfo(area:"0",whiskyicon:"05", name:"グレンファークラス", description:"シェリー樽熟成の重厚でパワフルなシングルモルト！"),
    whiskyInfo(area:"0",whiskyicon:"06", name:"グレンフィディック", description:"日本でシングルモルト広めたのはこのお酒のおかげ"),
    whiskyInfo(area:"0",whiskyicon:"07", name:"グレンマレイ", description:"シャルドネ白ワインの空き樽を使ったちょっと変わったシングルモルト！"),
    whiskyInfo(area:"0",whiskyicon:"08", name:"グレンリベット", description:"すべてのシングルモルトウイスキーの味の基準となるお酒です！"),
    whiskyInfo(area:"0",whiskyicon:"09", name:"バルヴェニー", description:"上質な香りに甘み、苦み、渋みがギュッと詰まった奥行きのある深い味わい！"),
    whiskyInfo(area:"0",whiskyicon:"10", name:"マッカラン", description:"香り高く、味も深みがありその高級感ある味わい"),
    whiskyInfo(area:"0",whiskyicon:"11", name:"ロングモーン", description:"シングルモルト通なら必ず名前を挙げる美味しいウイスキー銘柄の一つ！")],
    
    [whiskyInfo(area:"1",whiskyicon:"", name:"A", description:"xxxxxx")],
    [whiskyInfo(area:"2",whiskyicon:"", name:"A", description:"xxxxxx")],
    [whiskyInfo(area:"3",whiskyicon:"", name:"A", description:"xxxxxx")],
    [whiskyInfo(area:"4",whiskyicon:"", name:"A", description:"xxxxxx")],
    [whiskyInfo(area:"5",whiskyicon:"", name:"A", description:"xxxxxx")]
        
    ]
    
    let area: [String] = ["スペイサイド","ハイランド","ローランド","キャンベルタウン","アイランズ","アイラ島"]
    
    
    @IBOutlet weak var TableView: UITableView!
    
    var hiddenSections = Set<Int>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        TableView.delegate = self
               TableView.dataSource = self
               
               configureTableViewCell()
           
    }
    
    
    func configureTableViewCell(){
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        
        let cellID = "CustomCell"
        
        TableView.register(nib, forCellReuseIdentifier: cellID)
        
        
    }
    
    //rowを返すdelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if self.hiddenSections.contains(section){
            
            return 0
        }
        let items = group[section]
        return items.count
    
    }
    
    //cellに表示する内容を返すdelegate(indexpathの個数だけ呼ばれる)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cellの呼び出し
        let cell = TableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        
        let item = group[indexPath.section]
        if item.count > indexPath.row {
         
            //whiskyの設定
            cell.whisky.image = UIImage(named: item[indexPath.row].whiskyicon)
            //nameの設定
            cell.name.text = item[indexPath.row].name
            //descriptionの設定
            cell.descriptionLabel.text = item[indexPath.row].description
        }
     return cell
        
    }
    
    //画面を引き継いでの遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("didSelectRowAt", indexPath)
        
        let vc = DetailViewController()
        
        let item = group[indexPath.section]
        vc.whiskyInfo = item[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    //cellの高さの固定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    //sectionの繰り返し数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
//    //sectionの中のheaderに処理を加えるdelegate
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return area[section]
//    }

    //セクションにheaderを付与する
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //新規インスタンス作成
        let sectionButton = UIButton()
        //ボタンタイトル設定　セクションにタイトルを付与する
        sectionButton.setTitle(area[section], for: .normal)
        //背景色の設定
        sectionButton.backgroundColor = .systemBlue
        //ボタンのタグをセクションとして設定
        sectionButton.tag = section
        //ボタンに対するターゲットを設定する　折り畳んだり表示させたりすることができる
        sectionButton.addTarget(self, action: #selector(self.hideSection(sender:)), for: .touchUpInside)
        return sectionButton
        
    }
    
    
    //
    @objc private func hideSection(sender: UIButton){
        //create section
        let section = sender.tag
        //add indexpathsForsection method
        func indexPathsForSection() -> [IndexPath]{
            
            var indexPaths = [IndexPath]()
            let items = group[section]
            
            for row in 0..<items.count {
                
                indexPaths.append(IndexPath(row: row,section: section))
            }
            
            return indexPaths
        
        }
        
         // Logic to add/remove sections to/from hiddenSections, and delete and insert functionality for tableView
        if self.hiddenSections.contains(section){
            self.hiddenSections.remove(section)
            self.TableView.insertRows(at: indexPathsForSection(), with: .fade)
            
        } else {
            self.hiddenSections.insert(section)
            self.TableView.deleteRows(at: indexPathsForSection(), with: .fade)
            
        }
        
        
    }
    
    
    

}

