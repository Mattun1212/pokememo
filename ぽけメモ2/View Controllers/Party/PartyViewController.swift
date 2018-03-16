//  FirstViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2015/12/03.
//  Copyright © 2015年 マツシタ コウタロウ. All rights reserved.
//

/*
 - memoに遷移して戻ってくるとsection内が空っぽになる → recieveIndex に値が入ってない
 
 */




import UIKit
import RealmSwift



//MARK: - FirstViewController

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,InputTextTableCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var recieveIndex:Int?       //FormatVCから選択された分類を受け取る
    
    //cellの設定
    fileprivate let RootCellIdentifier = "RootCellIdentifier"
    fileprivate let SubCellIdentifier = "SubCellIdentifier"
    fileprivate let extendedSections = NSMutableIndexSet()
    
    
    //データ扱うクラス
    var saveData:SaveClass!
    
    //Partyを扱うためのClass
    var partyInfo:PartyInfo!              //なんかあったとき用
    var savedPartyInfo:Results<PartyInfo>?  //Realmから取得したデータ用 PartyInfoの配列(ArrayじゃなくてResult型)
    
    //表示を変更するsectionのrowの数
    var rowNum:Int!
    
    //タップされたcellの行数
    var tappedCellIndex:Int!
    
    var sendPokemon:Pokemon?
    ///MARK: - <Normal>
    
    ///初めて画面を表示する時に呼ばれるクラス
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //tableViewでどのcellを使うかの登録 今回は2種類
        self.tableView.register(TableViewRootCell.self, forCellReuseIdentifier: RootCellIdentifier)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: SubCellIdentifier)
//      self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    
    ///画面を表示するたびに呼ばれるクラス
    override func viewWillAppear(_ animated: Bool) {
        
        //扱う分類の設定 0:Single, 1:Double, 2:Triple
        saveData = SaveClass(recieveIndex: recieveIndex!)
        
    
        //保存してるpartyの情報を取得
        savedPartyInfo = saveData.getPartyInfo()
        print("partyInfo::\(savedPartyInfo)")
        
        tableView.reloadData()
        //データを一時的に代入するテスト関数
        //partyInfo.NameSave()
//        partyInfo.testOfDataSave()
        
    }
    
    //画面が消える（遷移する）タイミングで呼ばれる
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    
    
    
    //segueでの画面遷移前に呼ぶ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面に値を渡したい場合はここに書く
        if segue.identifier == "toMemo" {
            let memoViewController = segue.destination as! MemoViewController
            // ここに値渡しのコード
            memoViewController.selectedIndex = tappedCellIndex
            memoViewController.saveIndex = recieveIndex
        }else{
            let pokemonParaViewController = segue.destination as! PokemonParaViewController
            pokemonParaViewController.pokemon = self.sendPokemon
            pokemonParaViewController.saveIndex = self.recieveIndex!
            
 
        }
        
    }
    
    
    
    
    //ボタンをタップしたら
    @IBAction func addMemo() {
        //残ってる値のリセット
        tappedCellIndex = nil
        self.performSegue(withIdentifier: "toMemo", sender: nil)
        
    }
    
    
    
    
    ///MARK: - <UITableViewDataSource>
    
    ///section数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        //セクション数を返す, partyInfoの個数分,つまり、partyの数のセクションを用意する
        print("savedPartyInfo?.count::\(savedPartyInfo?.count)")
        
        if savedPartyInfo == nil{
            savedPartyInfo = partyInfo as? Results<PartyInfo>
        }
        return (savedPartyInfo?.count)!
    }
    
    ///section内のRowsの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*セクション
         true  -> numberOfRowInSection↑のrow数にする
         false -> 1にする(セクション名のところのみ)
         
         row 
         0: party名,  1...6:ポケモンの名前
         */
        
        //section名を入れる部分を追加するため+1
        rowNum = (savedPartyInfo?[section].pokemons.count)! + 1
        
        return isSectionExtended(section) ? rowNum : 1
    }
    
    
    ///Row内のcellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //いくつ目のRowかに応じてCellを使い分けるコードが書いてある
        
        /*
         ↓参考で確認しよう
         isRoot:Bool型
         indexPath.row が 0      -> true
         それ以外 -> false
         rowの数が0か否かを確認してる。
         */
        let isRoot = indexPath.row == 0
        
        
        /*
         identifier:String型
         isRoot(セクション内のrowの数)に応じてcellを変更する
         true  -> RootCellIdentifier
         false -> SubCellIdentifier
         */
        let identifier = isRoot ? RootCellIdentifier : SubCellIdentifier
        
        /*
         上で取得したcellの名前に応じて変更するcellを設定する
         */
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        /*
         ここからcellの設定
         isRootに応じて変える
         */
        if isRoot {
            //上のcellのアンラップ。nil判定。if cell != nil と同じ
            if let cell = cell as? TableViewRootCell {
                
                //↓cellの内容設定
                //partyTitleArray[indexPath.section]でデータを取得
                cell.label.text = savedPartyInfo?[indexPath.section].partyTitle
    
                //"Section \(indexPath.section)"
                cell.backgroundColor = UIColor(white: CGFloat(0.5 - 0.5 * Double(indexPath.section) / Double(tableView.numberOfSections)), alpha: 1.0)
                cell.label.textColor = UIColor.white
                
                var matchCount = (savedPartyInfo?[indexPath.section].matchCount)!
                if matchCount == 0{
                    matchCount = 1
                }
                var rate:Int = (savedPartyInfo?[indexPath.section].winningCount)! * 100 / matchCount
                
                cell.winningRateLabel.textColor = UIColor.white
                cell.winningRateLabel.text = "\(rate)%"
                
                //cellの種類に応じて内容変更。中身みて見よう。
                cell.extended = isSectionExtended(indexPath.section)
            }
        } else {
            //indexPath.rowから1引いてやらないと行数が配列の個数超えるので気をつける
            cell.textLabel?.text = savedPartyInfo?[indexPath.section].pokemons[indexPath.row-1].name
            
            
//            pokemonNameArray[indexPath.row-1]
            
        }
        return cell
        
    
       
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            self.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteButton.backgroundColor = UIColor.red
        
        return [deleteButton]
    }
    
    ///MARK: - <UITableViewDelegate>
    
    ///cellの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let isRoot = indexPath.row == 0
        if isRoot {
            return isSectionExtended(indexPath.section) ? 30 : 60
        } else {
            return 44
        }
    }
    
    ///cellがタップされたら
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        let isRoot = indexPath.row == 0
        if isRoot {
            didSelectRootCell(indexPath.section)
        }else{
            var pokemon:Pokemon = savedPartyInfo![indexPath.section].pokemons[indexPath.row]
            self.performSegue(withIdentifier: "ToPara", sender: nil)
            
        }
    }
    
    
    ///MARK: - TableviewCustom
    
    
    ///cellがタップされた時に呼ばれるメソッド
    fileprivate func didSelectRootCell(_ section: NSInteger) {
        var extended = isSectionExtended(section)
        extended = !extended
        if extended {
            extendedSections.add(section)
        } else {
            extendedSections.remove(section)
        }
        
        let numOfRows:Int = rowNum!
        var paths = [IndexPath]()
        for i in 1..<numOfRows {
            paths.append(IndexPath(row: i, section: section))
        }
        //                tableView.reloadData()
        //                tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
        
        tableView.beginUpdates()
        if extended {
            tableView.insertRows(at: paths, with: .automatic)
        } else {
            tableView.deleteRows(at: paths, with: .automatic)
        }
        tableView.endUpdates()
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: section)) as? TableViewRootCell {
                cell.extended = extended
            }
        })
    }
    
    ///Sectionが拡大してるかどうかの判定
    fileprivate func isSectionExtended(_ section: NSInteger) -> Bool {
        /*
         拡大してない -> false
         拡大してる   -> true
         */
        return extendedSections.contains(section)
    }
    
    
    
    ///MARK: - InputTextTableCellDelegate
    
/////////////↓ここ何？//////////////////////////////////////////////////////////////////////////////////////////////
    func textFieldDidEndEditing(_ cell: InputTextTableCell, value: NSString) {
        let path = tableView.indexPathForRow(at: cell.convert(cell.bounds.origin, to: tableView))
        NSLog("row = %d, value = %@", path!.row, value)
        
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
}


