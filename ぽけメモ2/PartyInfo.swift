//
//  PartyInfo.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2017/07/13.
//  Copyright © 2017年 マツシタ コウタロウ. All rights reserved.
//

import Foundation

//Partyのデータが入るクラス
class PartyInfo:NSObject{
    var selectedIndex: Int?
    let saveData: UserDefaults = UserDefaults.standard
    
    var pokemonNameArray:[[String]]!
    var pokemonContentArray:[[String]]!
    var saveIndex: Int!
    var partyTitleArray:[String]!
    var partyContentArray:[String]!
    
    
    init(pokemonNameArray: [[String]], pokemonContentArray: [[String]] ,partyTitleArray: [String] ,partyContentArray:[String]) {
        self.pokemonNameArray = pokemonNameArray
        self.pokemonContentArray = pokemonContentArray
        self.partyTitleArray = partyTitleArray
        self.partyContentArray = partyContentArray
    }
    
//    func NameSave()  {
//            if saveData.array(forKey: "pokemonNameArray") != nil {
//                partyTitleArray = saveData.array(forKey: "pokemonNameArray") as! [String]
//            }
    
//        if saveIndex == 0 {
//            if saveData.array(forKey: "titleSingleArray") != nil {
//                partyTitleArray = saveData.array(forKey: "titleSingleArray") as! [String]
//                // contentSingleArray = saveData.array(forKey: "contentSingleArray") as! [String]
//            }
//            
//            
//            if selectedIndex != nil{
//                FirstTextField.text! = partyTitleArray[selectedIndex!]
//                // contentTextView.text! = contentSingleArray[selectedIndex!]
//                
//            }
//            if saveData.array(forKey: "partytitleSingleArray") != nil {
//                partyTitleArray = saveData.array(forKey: "partytitleSingleArray") as! [String]
//                //contentSingleArray = saveData.array(forKey: "partycontentSingleArray") as! [String]
//            }
//            
//            
//            if selectedIndex != nil{
//                titleTextField.text! = partyTitleArray[selectedIndex!]
//                // contentTextView.text! = partycontentSingleArray[selectedIndex!]
//                
//            }
//            
//            
//        }
//        
//        if saveIndex == 1 {
//            if saveData.array(forKey: "titleDoubleArray") != nil {
//                partyTitleArray = saveData.array(forKey: "titleDoubleArray") as! [String]
//                // contentDoubleArray = saveData.array(forKey: "contentDoubleArray") as! [String]
//            }
//            
//            
//            if selectedIndex != nil{
//                titleTextField.text! = partyTitleArray[selectedIndex!]
//                // contentTextView.text! = contentDoubleArray[selectedIndex!]
//                
//            }
//            
//            if saveData.array(forKey: "partytitleDoubleArray") != nil {
//                partyTitleArray = saveData.array(forKey: "partytitleDoubleArray") as! [String]
//                //  contentDoubleArray = saveData.array(forKey: "partycontentDoubleArray") as! [String]
//            }
//            
//            
//            if selectedIndex != nil{
//                titleTextField.text! = partyTitleArray[selectedIndex!]
//                // contentTextView.text! = partycontentDoubleArray[selectedIndex!]
//                
//            }
//            
//            
//        }
//        if saveIndex == 2 {
//            if saveData.array(forKey: "titleTripleArray") != nil {
//                partyTitleArray = saveData.array(forKey: "titleTripleArray") as! [String]
//                // contentTripleArray = saveData.array(forKey: "contentTripleArray") as! [String]
//            }
//            
//            
//            if selectedIndex != nil{
//                titleTextField.text! = partyTitleArray[selectedIndex!]
//                // contentTextView.text! = contentTripleArray[selectedIndex!]
//                
//            }
//            
//            if saveData.array(forKey: "partytitleTripleArray") != nil {
//                partyTitleArray = saveData.array(forKey: "partytitleTripleArray") as! [String]
//                //contentTripleArray = saveData.array(forKey: "partycontentTripleArray") as! [String]
//            }
//            
//            
//            if selectedIndex != nil{
//                titleTextField.text! = partyTitleArray[selectedIndex!]
//                //  contentTextView.text! = partycontentTripleArray[selectedIndex!]
//                
//            }
//            
//        }
//        
//    }
    
    
    //    func testOfDataSave(){
    //        self.pokemonNameArray = [
    //            ["ピカチュウ","カビゴン","コイキング"],
    //            ["犬","猿","キジ"]
    //        ]
    //        self.pokemonContentArray = [
    //            ["ネズミ","",""]
    //        ]
    //
    //        self.partyTitleArray = ["まっつん", "桃太郎"]
    //        self.partyContentArray = ["強い","鬼"]
    //    }
    }


///UserDefalutsを扱いやすくするクラス。
class SaveClass {
    
    var keyOfUserDefault:String?
    
    init(recieveIndex:Int){
        var formatName:String?
        
        switch recieveIndex {
        case 0:
            formatName = "SingleArray"
        case 1:
            formatName = "DoubleArray"
        case 2:
            formatName = "TripleArray"
        default:
            break
        }
        
        self.keyOfUserDefault = formatName
        
    }
    
    func getPartyInfo() -> PartyInfo {
        if UserDefaults.standard.object(forKey: self.keyOfUserDefault!) != nil{
            return UserDefaults.standard.object(forKey: self.keyOfUserDefault!) as! PartyInfo
        }else{
            var newParty = PartyInfo(pokemonNameArray: [[String]](), pokemonContentArray: [[String]](),partyTitleArray: [String]() ,partyContentArray:[String]())
            return newParty
        }
    }
    
    func savePartyInfo(partyInfo:PartyInfo) {
        //partyInfoをセーブする。
        UserDefaults.standard.set(partyInfo, forKey: keyOfUserDefault!)
        //        FirstViewController.sendText.append(self.firstTextField.text!)
        //        FirstViewController.sendText.append(self.secondTextField.text!)
        //        FirstViewController.sendText.append(self.thirdTextField.text!)
        //        FirstViewController.sendText.append(self.fourthTextField.text!)
        //        FirstViewController.sendText.append(self.fifthTextField.text!)
        //        FirstViewController.sendText.append(self.sixthTextField.text!)
        
    }
    
}

    
