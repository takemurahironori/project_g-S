//
//  ViewController.swift
//  practice_screen2
//
//  Created by 竹村博徳 on 2020/07/04.
//  Copyright © 2020 竹村博徳. All rights reserved.
//


import UIKit
import XLPagerTabStrip

class MainViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        //バーの色
        settings.style.buttonBarBackgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //ボタンの色
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        //セルの文字色
        settings.style.buttonBarItemTitleColor = UIColor.white
        //セレクトバーの色
        settings.style.selectedBarBackgroundColor = UIColor(red: 254/255, green: 0, blue: 124/255, alpha: 1)
        super.viewDidLoad()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //管理されるViewControllerを返す処理
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "First")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Second")
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Third")
       let forthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Forth")
        let childViewControllers:[UIViewController] = [firstVC, secondVC, thirdVC,forthVC]
        return childViewControllers
    }
}
