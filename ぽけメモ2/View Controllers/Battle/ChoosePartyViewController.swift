//
//  BattleFormatViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2017/10/26.
//  Copyright © 2017年 マツシタ コウタロウ. All rights reserved.
//

import UIKit
import RealmSwift

class ChoosePartyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            
            
        }
    }
    
    
    let nib = UINib(nibName: "PartyCell", bundle: nil)
    
    
    let PartyCellIdentifier = "PartyCellIdentifier"
    //データ扱うクラス
    var saveData:SaveClass!
    var partyInfo: PartyInfo = PartyInfo()
    //Partyを扱うためのClass
    //なんかあったとき用
    var savedPartyInfo:Results<PartyInfo>?  //Realmから取得したデータ用 PartyInfoの配列(ArrayじゃなくてResult型)
    
    var sendPokemon:Pokemon?
    
    var rowNum:Int!
    //    var formatArray = [String]()
    var tapIndex: Int!  //tableViewでタップされた行を記録する
    
    //最初に呼ばれるやつ
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: PartyCellIdentifier)
        tableView.register(nib, forCellReuseIdentifier: "PartyCellIdentifier")
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //        //扱う分類の設定 0:Single, 1:Double, 2:Triple
        //        saveData = SaveClass(recieveIndex: recieveIndex!)
        //
        //保存してるpartyの情報を取得
        
        
        
        saveData = SaveClass()
        
        savedPartyInfo = saveData.getPartyInfoAll()
        
        
//        print("partyInfo::\(savedPartyInfo)")
        
        tableView.reloadData()
        
        
        //データを一時的に代入するテスト関数
        //partyInfo.NameSave()
        //        partyInfo.testOfDataSave()
        
    }
    ///MARK: - <UITableViewDataSource>
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print("savedPartyInfo?.count::\(savedPartyInfo?.count)")
        
        if savedPartyInfo == nil{
            savedPartyInfo = partyInfo as? Results<PartyInfo>
            
        }
        
        rowNum = (savedPartyInfo?[section].pokemons.count)! + 1
        
    
        return (savedPartyInfo?.count)! 
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //            var pokemon:Pokemon = savedPartyInfo![indexPath.section].pokemons[indexPath.row]
        self.performSegue(withIdentifier: "toBattle", sender: nil)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartyCellIdentifier, for: indexPath) as! PartyCell
        cell.textLabel?.text = savedPartyInfo?[indexPath.section].partyTitle
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面に値を渡したい場合はここに書く
        if segue.identifier == "toBattle" {
            let battleViewController = segue.destination as! SecondViewController
        }
        
//        if segue.identifier == "ToPara" {
//            let partyParaViewController = segue.destination as! PokemonParaViewController
//        }
//        
   }
}













//    //どのCellを使って、Cellに何を表示するか決めるとこ
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//        cell?.textLabel?.text = formatArray[indexPath.row]
//
//        return cell!
//    }
//
//    //Cellがタップされたら反応するとこ
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        NSLog("%@が選ばれました", formatArray[indexPath.row])
//        tapIndex = indexPath.row
//
//        //遷移
//        performSegue(withIdentifier: "toBattle", sender: nil)
//    }

