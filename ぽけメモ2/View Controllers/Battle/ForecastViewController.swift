//
//  ForecastViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/06/23.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

import RealmSwift

class ForecastViewController: UIViewController {
    
    @IBOutlet var firstbutton: UIButton!
    @IBOutlet var secondbutton: UIButton!
    @IBOutlet var thirdbutton: UIButton!
    @IBOutlet var fourthbutton: UIButton!
    @IBOutlet var fifthbutton: UIButton!
    @IBOutlet var sixthbutton: UIButton!
    
    var sendText:[String] = [String]()
    
    var iconload = IconLoad()
    var loadText = [[String]]()
    var buttonArray:[UIButton]!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(sendText)
        buttonArray = [firstbutton,secondbutton,thirdbutton,fourthbutton,fifthbutton,sixthbutton]
       loadText = iconload.loadcsv()
        
        for i in  0..<loadText.count-1 {
            for j in 0..<sendText.count{
                if sendText[j] == loadText[i][1]{
                    buttonArray[j].setBackgroundImage(UIImage(named: loadText[i][2]), for: .normal)
//                   print(buttonArray[j].backgroundImage(for: .normal) ?? )
                    
                }
            }
            
        }
        
        
    }
    
    @IBAction func buttonTapped(_ sender : Any){
        for k in 0..<buttonArray.count{
                count += 1
                if(count%2 == 0){
                    buttonArray[k].setTitleColor(UIColor.red, for: .normal)
                }else{
                    buttonArray[k].setTitleColor(UIColor.white, for: .normal)
                }
            }
        }
       
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




