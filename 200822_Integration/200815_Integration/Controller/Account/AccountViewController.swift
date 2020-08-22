//
//  ViewController.swift
//  200814_login
//
//  Created by 竹村博徳 on 2020/08/14.
//  Copyright © 2020 竹村博徳. All rights reserved.
//
import UIKit
import Firebase
import FirebaseUI

class AccountViewController: UIViewController,FUIAuthDelegate {

     @IBOutlet weak var authButton: UIButton!

    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()!}}
    
    // 認証に使用するプロバイダの選択
          let providers: [FUIAuthProvider] = [
              FUIGoogleAuth(),
              FUIFacebookAuth(),
              FUIEmailAuth()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // authUIのデリゲート
        self.authUI.delegate = self
        self.authUI.providers = providers
        authButton.addTarget(self,action: #selector(self.authButtonTapped(sender:)),for: .touchUpInside)
    }
    
    //ボタンを丸くする
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
//         コードでボタンの色と位置を指定する
//          self.authButton.frame = CGRect(x: (self.view.frame.size.width / 2) - 150, y:    (self.view.frame.size.height / 2) - 50, width: 300, height: 100)
//          self.authButton.backgroundColor = UIColor.red
//
          //角丸の程度を指定
          self.authButton.layer.cornerRadius = 10.0
      }


    @objc func authButtonTapped(sender : AnyObject) {
        // FirebaseUIのViewの取得
        let authViewController = self.authUI.authViewController()
        // FirebaseUIのViewの表示
        self.present(authViewController, animated: true, completion: nil)
    }

    //　認証画面から離れたときに呼ばれる（キャンセルボタン押下含む）
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
        // 認証に成功した場合
        if error == nil {
            self.performSegue(withIdentifier: "Mylibrary", sender: nil)
        } else {
        //失敗した場合
            print("error")
        }
    }
    
    
}
