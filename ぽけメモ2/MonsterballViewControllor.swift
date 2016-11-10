//
//  MonsterballViewControllor.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/10/06.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class MonsterballViewControllor: UITabBarController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            // タブ真ん中にボタンを置く
            setupBigCenterButton()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        // タブ真ん中のボタン作成
        private func setupBigCenterButton(){
//            let monsterballImageView = UIImageView()
//            // UIImageViewを作成する.
//            
//            // 表示する画像を設定する.
//            let monsterballImage = UIImage(named: "monsterball.png")
//            // monsterballImageView.sizeToFit()
//            // 画像をUIImageViewに設定する.
//            monsterballImageView.image = monsterballImage
//            
//            // 画像の表示する座標を指定する.
//            monsterballImageView.center = CGPoint(x: tabBar.bounds.size.width / 2, y: tabBar.bounds.size.height - (monsterballImageView.bounds.size.height/2))
            
            
            
            
            let button = UIButton(type: .Custom)
            button.setBackgroundImage(UIImage(named: "monsterball.png") , forState: .Normal)   // TODO:画像の用意
            button.sizeToFit()
            button.center = CGPoint(x: tabBar.bounds.size.width / 2, y: tabBar.bounds.size.height - (button.bounds.size.height/2))
            button.addTarget(self, action: "tapBigCenter:", forControlEvents: .TouchUpInside)
            button.enabled = false
            tabBar.addSubview(button)
        }
        
        // タブ真ん中を選択する
        func tapBigCenter(sender:AnyObject){
            selectedIndex = 2;
        }
    }

