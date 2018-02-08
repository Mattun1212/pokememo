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
    @IBOutlet var seventhbutton: UIButton!
    
    var sendText:[String] = [String]()
    
    var iconload = IconLoad()
    var loadText = [[String]]()
    var buttonArray:[UIButton]!
    var labelArray:[UILabel]!
    var number = 1
    var num = 1
    var Snum :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Snum = String(num)
       
        
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
    
    @IBAction func buttonTapped(_ sender : UIButton){
        number += 1
                if(number%2 == 0){
                    sender.backgroundColor = UIColor.red
                }else{
                    sender.backgroundColor = UIColor.clear
                }
        num += 1
        if num == 0{
           Snum = " "
        }else if num >= 4{
           num = 0
        }
        sender.setTitle(Snum, for: .normal)
    

        }

    @IBAction func clear(_ sender : UIButton){
        Snum = " "
        for l in 0..<buttonArray.count{
            buttonArray[l].backgroundColor = UIColor.clear
            buttonArray[l].setTitle(" ", for: .normal)
        }
    
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面に値を渡したい場合はここに書く
        if segue.identifier == "toAnalyze" {
//            let ForecastViewController = segue.destination as! AnalyzeViewController
        }
    
}


}

