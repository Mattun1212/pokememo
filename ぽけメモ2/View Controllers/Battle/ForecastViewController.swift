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
    var sendArray:[UIButton] = []
    var labelArray:[UILabel]!
    var number = 0
    var num = 0
    var Snum :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Snum = String(number)
        
        
        //        print(sendText)
        buttonArray = [firstbutton,secondbutton,thirdbutton,fourthbutton,fifthbutton,sixthbutton]
        
        
        loadText = iconload.loadcsv()
        
        for i in  0..<loadText.count-1 {
            for j in 0..<sendText.count{
                if sendText[j] == loadText[i][1]{
                    buttonArray[j].setBackgroundImage(UIImage(named: loadText[i][2]), for: .normal)
                    buttonArray[j].adjustsImageWhenHighlighted = false
                    //                   print(buttonArray[j].backgroundImage(for: .normal) ?? )
                    
                }
            }
            
            
        }
        
        
    }
    
    @IBAction func buttonTapped(_ sender : UIButton){
        
        sender.backgroundColor = UIColor.red
        if number >= 3{
            sender.backgroundColor = UIColor.clear
        }
        
        number += 1
        if number == 0{
            sender.setTitle(" ", for: .normal)

        }else if number == 1{
            Snum = "1"
            sendArray.append(sender)
            sender.isEnabled = false
        }else if number == 2{
            Snum = "2"
            sendArray.append(sender)
            sender.isEnabled = false
        }else if number == 3{
            Snum = "3"
            sendArray.append(sender)
            sender.isEnabled = false
        }else if number >= 4{
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
        if segue.identifier == "ToAnalyze" {
           let resultViewController = segue.destination as! ResultViewController
            for k in 0..<sendArray.count-1{
               resultViewController.buttonArray.append(sendArray[k])
            
        }
        
    }
    
    
}


}
