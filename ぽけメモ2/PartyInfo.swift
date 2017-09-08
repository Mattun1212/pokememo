//
//  PartyInfo.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2017/07/13.
//  Copyright © 2017年 マツシタ コウタロウ. All rights reserved.
//

import Foundation
import RealmSwift


//Pokemonのclass
class Pokemon: Object {
    dynamic var name: String = ""
    
}



//Partyのデータが入るクラス
class PartyInfo: Object {
    var selectedIndex: Int = 0
    let saveData: UserDefaults = UserDefaults.standard
    
//    dynamic var pokemonNameArray:[[String]]!
//    dynamic var pokemonContentArray:[[String]]!
//    dynamic var saveIndex: Int = 0
//    dynamic var partyTitleArray:[String]!
//    dynamic var partyContentArray:[String]!
    
    dynamic var partyType:String = ""
    dynamic var partyTitle:String = ""
    dynamic var partyComment:String = ""
    var pokemons = List<Pokemon>()
    
    
//    dynamic var pokemonContentArray:[String]!
//    dynamic var saveIndex: Int = 0
    
//    dynamic var partyContentArray:[String]!
    
    
//    init(pokemonNameArray: [[String]], pokemonContentArray: [[String]] ,partyTitleArray: [String] ,partyContentArray:[String]) {
//        self.pokemonNameArray = pokemonNameArray
//        self.pokemonContentArray = pokemonContentArray
//        self.partyTitleArray = partyTitleArray
//        self.partyContentArray = partyContentArray
//    }
    
}


///UserDefalutsを扱いやすくするクラス。
class SaveClass {
    
    var partyType:String?
    
    init(recieveIndex:Int){
        var formatName:String?
        
        switch recieveIndex {
        case 0:
            formatName = "Single"
        case 1:
            formatName = "Double"
        case 2:
            formatName = "Triple"
        default:
            break
        }
        
        self.partyType = formatName
        
    }
    
    func getPartyInfo() -> Results<PartyInfo> {
//        if UserDefaults.standard.object(forKey: self.keyOfUserDefault!) != nil{
//            return UserDefaults.standard.object(forKey: self.keyOfUserDefault!) as! PartyInfo
//        }else{
//            var newParty = PartyInfo(pokemonNameArray: [[String]](), pokemonContentArray: [[String]](),partyTitleArray: [String]() ,partyContentArray:[String]())
//            return newParty
//        }
        
        let realm = try! Realm()
        let partyInfo:Results<PartyInfo>?
        
        print(partyType)
//        if realm.objects(PartyInfo.self) != nil{
             partyInfo = realm.objects(PartyInfo.self).filter("partyType == %@",partyType!)
//        }
       
        
        print("aaaa")
        
        return partyInfo!
        
        
    }
    
    func savePartyInfo(partyInfo:PartyInfo) {
        //partyInfoをセーブする。
//        UserDefaults.standard.set(partyInfo, forKey: keyOfUserDefault!)
        
        //        FirstViewController.sendText.append(self.firstTextField.text!)
        //        FirstViewController.sendText.append(self.secondTextField.text!)
        //        FirstViewController.sendText.append(self.thirdTextField.text!)
        //        FirstViewController.sendText.append(self.fourthTextField.text!)
        //        FirstViewController.sendText.append(self.fifthTextField.text!)
        //        FirstViewController.sendText.append(self.sixthTextField.text!)
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(partyInfo)
        }
        
    }
    
}

    
