//
//  ViewController.swift
//  practice_CollectionView_slid
//
//  Created by 竹村博徳 on 2020/06/07.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var horizontalCollectionView: UICollectionView!
    
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!
    
    var photoArray = ["arietty1","laputa1","kaguya1","chihiro1"]
    var titleArray = ["アリエッティ","ラピュタ","かぐや","千と千尋"]
    
    
    
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
    extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        
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
               cell.titleLabel.text = "\(titleArray[indexPath.row])への旅"
               cell.dateLabel.text = "06/08~06/15"
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

    
    
    

}

