
//
//  recommend.swift
//  toppage_ver_1.0
//
//  Created by 竹村博徳 on 2020/07/19.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import UIKit

class recommendViewController: UIViewController {


    
    @IBOutlet weak var horizontalCollectionView: UICollectionView!
    
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!
//
    //写真のnoを採用する
    var photoArray = ["01","02","03","04","05","06","07","08","09","10","11"]
    var titleArray = ["アベラワー","クラガンモア","グレンエルギン","グレングラント","グレンファークラス","グレンフィディック","グレンマレイ","グレンリベット","バルヴェニー","マッカラン","ロングモーン"]
    

        var descriptionArray = [
        
        "バニラのような甘みを感じる美味しい銘柄！",
       "風味の複雑さが別格！飲みやすいだけじゃない、スパイシーさがウリ！",
        "癖がなく飲みやすいウイスキー",
        "風味は強くなく、サッパリとして飲みやすい！",
        "シェリー樽熟成の重厚でパワフルなシングルモルト！",
        "日本でシングルモルト広めたのはこのお酒のおかげ",
        "シャルドネ白ワインの空き樽を使ったちょっと変わったシングルモルト！",
       "すべてのシングルモルトウイスキーの味の基準となるお酒です！",
       "上質な香りに甘み、苦み、渋みがギュッと詰まった奥行きのある深い味わい！",
       "香り高く、味も深みがありその高級感ある味わい",
        "シングルモルト通なら必ず名前を挙げる美味しいウイスキー銘柄の一つ！",
        ]
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //frameの高さと幅を決める
        viewWidth = view.frame.width
        viewHeight = view.frame.height
        navHeight = self.navigationController?.navigationBar.frame.size.height

        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        
        
        //ViewDidLoad()内でregister(_:forCellWithReuseIdentifier:)メソッドを使ってCollectionViewCellの登録。第一引数にUINibオブジェクトを渡し、第二引数では先ほどcellにつけたcellというidentifierを渡す。UINibのnibNameはCollectionViewのxibファイル名と一致していることを確認。
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
        horizontalCollectionView.register(nib, forCellWithReuseIdentifier: "cell")

        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white]


    }
    
}
        //ここでdelegateしている本来は「class ViewController: UIViewController,~」の〜でもできる
    extension recommendViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
            
        //セルの中身
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
               
            cell.backgroundColor = UIColor.white
               cell.layer.cornerRadius = 12
               cell.layer.shadowOpacity = 0.4
               cell.layer.shadowRadius = 12
               cell.layer.shadowColor = UIColor.black.cgColor
               cell.layer.shadowOffset = CGSize(width: 8, height: 8)
               cell.layer.masksToBounds = false
               cell.titleLabel.text = "\(titleArray[indexPath.row])"
//            cell.descriptionLabel.text = "\(descriptionArray[indexPath.row])"
////               cell.dateLabel.text = "06/08~06/15"
               cell.backgroundImageView.image = UIImage(named: photoArray[indexPath.row])
               return cell

           }
        
        //セル同士の間隔調整
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
               return 24
           }
    
        //セルのサイズ調整
           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
               cellWidth = viewWidth
               cellHeight = viewHeight+100
               cellOffset = viewWidth-cellWidth
               return CGSize(width: cellWidth, height: cellHeight)
           }
        
        
        // セルの余白調整
           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
               return UIEdgeInsets(top: -navHeight,left: cellOffset/2,bottom: 0,right: cellOffset/2)
           }
        //collectionview中のセルをタップしたかどうかを検知する
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              print("Cellがタップされた！")
            
                  let dialog = UIAlertController(title: "今月お届けするウイスキー", message: "このウイスキーで良いですか？", preferredStyle: .alert)
                          // 選択肢(ボタン)を2つ(OKとCancel)追加します
                          //   titleには、選択肢として表示される文字列を指定します
                          //styleには、通常は「.default」、キャンセルなど操作を無効にするものは「.cancel」、削除など注意して選択すべきものは「.destructive」を指定します
                          dialog.addAction(UIAlertAction(title: "飲んでみたい！", style: .default, handler: nil))
                          dialog.addAction(UIAlertAction(title: "もう少し悩みます。", style: .cancel, handler: nil))
                          // 生成したダイアログを実際に表示します
                          self.present(dialog, animated: true, completion: nil)
            
        }

    
    

}
