//
//  ResultViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2018/02/22.
//  Copyright © 2018年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var firstbutton: UIButton!
    @IBOutlet var secondbutton: UIButton!
    @IBOutlet var thirdbutton: UIButton!
//    @IBOutlet var fourthbutton: UIButton!
//    @IBOutlet var fifthbutton: UIButton!
//    @IBOutlet var sixthbutton: UIButton!
    var buttonArray:[UIButton] = []
    var sendText:[String] = [String]()
    var loadText = [[String]]()
    var iconload = IconLoad()
    var number = 0
    var num = 0
    var Snum :String?

    override func viewDidLoad() {
        super.viewDidLoad()

        Snum = String(number)
        
        buttonArray = []
        
        
        loadText = iconload.loadcsv()
        
    }
            
        // Do any additional setup after loading the view.

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func buttonTapped(_ sender : UIButton){
        
        sender.backgroundColor = UIColor.blue
        if number >= 3{
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
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
