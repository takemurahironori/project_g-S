//
//  ViewController.swift
//  pageview
//
//  Created by 竹村博徳 on 2020/07/08.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIScrollViewDelegate {

    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var whisky = ["アベラワー","クラガンモア","グレンエルギン","グレングラント","グレンファークラス","グレンフィディック","グレンマレイ","グレンリベット","バルヴェニー","マッカラン","ロングモーン"]
    
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    pageControl.numberOfPages = whisky.count
    
    setupScreens()

    scrollView.delegate = self
        
    }
    
    func setupScreens() {
        for index in 0..<whisky.count {
            // 1.
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            // 2.
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: whisky[index])

            self.scrollView.addSubview(imgView)
        }

        // 3.
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(whisky.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }

    
}

