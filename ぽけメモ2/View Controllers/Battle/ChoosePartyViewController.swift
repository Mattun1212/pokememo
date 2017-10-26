//
//  BattleFormatViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2017/10/26.
//  Copyright © 2017年 マツシタ コウタロウ. All rights reserved.
//

import UIKit
import RealmSwift

class BattleFormatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,InputTextTableCellDelegate{
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    
    fileprivate let PartyCellIdentifier = "PartyCellIdentifier"
    //データ扱うクラス
    var saveData:SaveClass!
    
    //Partyを扱うためのClass
    var partyInfo:PartyInfo!              //なんかあったとき用
    var savedPartyInfo:Results<PartyInfo>?  //Realmから取得したデータ用 PartyInfoの配列(ArrayじゃなくてResult型)
    
    
//    var formatArray = [String]()
    var tapIndex: Int!  //tableViewでタップされた行を記録する
    let saveData: UserDefaults = UserDefaults.standard
    
    //最初に呼ばれるやつ
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
//        //扱う分類の設定 0:Single, 1:Double, 2:Triple
//        saveData = SaveClass(recieveIndex: recieveIndex!)
//        
        
        //保存してるpartyの情報を取得
        savedPartyInfo = saveData.getPartyInfo()
        print("partyInfo::\(savedPartyInfo)")
        
        tableView.reloadData()
        //データを一時的に代入するテスト関数
        //partyInfo.NameSave()
        //        partyInfo.testOfDataSave()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        //セクション数を返す, partyInfoの個数分,つまり、partyの数のセクションを用意する
        print("savedPartyInfo?.count::\(savedPartyInfo?.count)")
        
        if savedPartyInfo == nil{
            savedPartyInfo = partyInfo as? Results<PartyInfo>
        }
        return (savedPartyInfo?.count)!
    }
    //どのCellを使って、Cellに何を表示するか決めるとこ
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面に値を渡したい場合はここに書く
        let battleViewController = segue.destination as! BattleViewController
        // ここに値渡しのコード
        battleViewController.recieveIndex = tapIndex
        
    }
    
    
}

