//
//  ResultDoubleViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2018/02/22.
//  Copyright © 2018年 マツシタ コウタロウ. All rights reserved.
//

import UIKit
import RealmSwift

class ResultDoubleViewController: UIViewController {
    @IBOutlet var firstbutton: UIButton!
    @IBOutlet var secondbutton: UIButton!
    @IBOutlet var thirdbutton: UIButton!
    @IBOutlet var fourthbutton: UIButton!
    //    @IBOutlet var fifthbutton: UIButton!
    //    @IBOutlet var sixthbutton: UIButton!
    
    @IBOutlet var segment:UISegmentedControl!
    
    var buttonArray:[UIButton] = []
    var ceptImage:[UIImage] = []
    var sendText:[String] = [String]()
    var loadText = [[String]]()
    var iconload = IconLoad()
    var number = 0
    var num = 0
    var Snum :String?
    var getPartyTitle:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonArray = [firstbutton,secondbutton,thirdbutton,fourthbutton]
        
        Snum = String(number)
        
        loadText = iconload.loadcsv()
        
        for i in 0...ceptImage.count-1{
            buttonArray[i].setBackgroundImage(ceptImage[i], for: .normal)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender : UIButton){
        
        sender.backgroundColor = UIColor.blue
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
            
        }else if number >= 5{
            Snum = " "
        
        }
        
        sender.setTitle(Snum, for: .normal)
    }
    
    @IBAction func decide(){
        var saveClass = SaveClass()
        var getPartyInfo = saveClass.getPartyInfoAll().filter("partyTitle == %@",getPartyTitle)
        
        let realm = try! Realm()
       
            try! realm.write{
                getPartyInfo.first!.matchCount += 1
                if segment.selectedSegmentIndex == 0 {
                    getPartyInfo.first!.winningCount += 1
                }
            }
        
        
        
        saveClass.savePartyInfo(partyInfo: getPartyInfo.first!)
        
        
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
