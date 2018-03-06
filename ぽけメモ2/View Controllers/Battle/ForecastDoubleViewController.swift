//
//  ForecastDoubleViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2018/02/11.
//  Copyright © 2018年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

import RealmSwift

class ForecastDoubleViewController: UIViewController {
    
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
    var number = 0
    var num = 0
    var Snum :String?
    
    var getPartyTitle:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Snum = String(number)
        
        
                print(sendText)
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
        
        sender.backgroundColor = UIColor.red
        if number >= 4{
            sender.backgroundColor = UIColor.clear
        }
        
        number += 1
        if number == 0{
            sender.setTitle(" ", for: .normal)
        }else if number == 1{
            Snum = "1"
            sender.isEnabled = false
        }else if number == 2{
            Snum = "2"
            sender.isEnabled = false
        }else if number == 3{
            Snum = "3"
            sender.isEnabled = false
        }else if number == 4{
            Snum = "4"
            sender.isEnabled = false
        }else if number >= 5{
            Snum = " "
        }
        sender.setTitle(Snum, for: .normal)
    }
    
    
    @IBAction func clear(_ sender : UIButton){
        number = 0
        for o in 0..<buttonArray.count{
            buttonArray[o].isEnabled = true
        }
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


