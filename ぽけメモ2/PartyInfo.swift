//
//  PartyInfo.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2017/07/13.
//  Copyright © 2017年 マツシタ コウタロウ. All rights reserved.
//

import Foundation
import RealmSwift

/*
 ## realmの使い方
 ここを確認しよう -> https://realm.io/jp/docs/swift/latest/
 
 ## realmのいいところ
 ・データベースとしてデータを扱いやすい
 ・filterをかけてほしい情報だけ取得するのも簡単
    ex> partyInfo = realm.objects(PartyInfo.self).filter("partyType == %@",partyType!)
    partyType: Single, Double, ...などに応じて 上みたいな書き方でフィルターできる
 
 ## 配列の扱いかた
    realmにおいて配列はそのまま保存できない。代わりにListってのを使う。使い方は大体Arrayと一緒。
 
 ## 注意点
 realmで使うclassの中身(下でいうPokemonやPartyInfo)を変更したら、シミュレータや実機などでのポケメモのアプリは一旦削除してから、runすること。データベースの表が変わるから、そこでエラーが起きる。
 
 
 */


//Pokemonのclass
class EV:Object{
    
}


class Pokemon: Object {
    dynamic var name: String = ""
    dynamic var EV: String = ""
    dynamic var move: String = ""
    dynamic var ability: String = ""
    dynamic var nature: String = ""
    dynamic var item: String = ""
    
    
    
}



//Partyのデータが入るクラス
class PartyInfo: Object {
    var selectedIndex: Int = 0
//    let saveData: UserDefaults = UserDefaults.standard
    
    dynamic var partyType:String = ""
    dynamic var partyTitle:String = ""
    dynamic var partyComment:String = ""
    var pokemons = List<Pokemon>()  //配列の代わりにListを使う
    
}


///データの保存を扱いやすくするクラス。
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

        let realm = try! Realm()
        let partyInfo:Results<PartyInfo>?
        
        print("partyType: \(partyType)")

        partyInfo = realm.objects(PartyInfo.self).filter("partyType == %@",partyType!)

        return partyInfo!
        
        
    }
    
    func savePartyInfo(partyInfo:PartyInfo) {
        //partyInfoをセーブする。        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(partyInfo)
        }
        
    }
    
}

    
