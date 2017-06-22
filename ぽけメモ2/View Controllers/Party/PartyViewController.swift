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






/*
 データを扱いやすくするクラスを作ったよー
 
 - 今まで: UserDelaultに配列をそれぞれ保存してた
 - これから: PartyInfo というクラスでひとまとまりにしながら保存していく
 
 メリット→userDefalutのキーの数が一気に減る
 変数名.pokemonNameArray って感じで扱えるようになる
 
 -PartyInfo:
 
 */

//MARK: - NewClass


///Partyのデータが入るクラス
class PartyInfo{
    var selectedIndex: Int?
    let saveData: UserDefaults = UserDefaults.standard
    var pokemonNameArray:[[String]]!
    var pokemonContentArray:[[String]]!
    var saveIndex: Int!
    var partyTitleArray:[String]!
    var partyContentArray:[String]!
    
    
    init() {
        self.pokemonNameArray = [[String]]()
        self.pokemonContentArray = [[String]]()
        self.partyTitleArray = [String]()
        self.partyContentArray = [String]()
    }
    
    func NameSave()  {
        if saveIndex == 0 {
            if saveData.array(forKey: "titleSingleArray") != nil {
                partyTitleArray = saveData.array(forKey: "titleSingleArray") as! [String]
               // contentSingleArray = saveData.array(forKey: "contentSingleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                FirstTextField.text! = partyTitleArray[selectedIndex!]
               // contentTextView.text! = contentSingleArray[selectedIndex!]
                
            }
            if saveData.array(forKey: "partytitleSingleArray") != nil {
                partyTitleArray = saveData.array(forKey: "partytitleSingleArray") as! [String]
                //contentSingleArray = saveData.array(forKey: "partycontentSingleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partyTitleArray[selectedIndex!]
               // contentTextView.text! = partycontentSingleArray[selectedIndex!]
                
            }
            
            
        }
        if saveIndex == 1 {
            if saveData.array(forKey: "titleDoubleArray") != nil {
                partyTitleArray = saveData.array(forKey: "titleDoubleArray") as! [String]
               // contentDoubleArray = saveData.array(forKey: "contentDoubleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partyTitleArray[selectedIndex!]
               // contentTextView.text! = contentDoubleArray[selectedIndex!]
                
            }
            
            if saveData.array(forKey: "partytitleDoubleArray") != nil {
                partyTitleArray = saveData.array(forKey: "partytitleDoubleArray") as! [String]
              //  contentDoubleArray = saveData.array(forKey: "partycontentDoubleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partyTitleArray[selectedIndex!]
               // contentTextView.text! = partycontentDoubleArray[selectedIndex!]
                
            }
            
            
        }
        if saveIndex == 2 {
            if saveData.array(forKey: "titleTripleArray") != nil {
                partyTitleArray = saveData.array(forKey: "titleTripleArray") as! [String]
               // contentTripleArray = saveData.array(forKey: "contentTripleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partyTitleArray[selectedIndex!]
               // contentTextView.text! = contentTripleArray[selectedIndex!]
               
            }
            
            if saveData.array(forKey: "partytitleTripleArray") != nil {
                partyTitleArray = saveData.array(forKey: "partytitleTripleArray") as! [String]
                //contentTripleArray = saveData.array(forKey: "partycontentTripleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partyTitleArray[selectedIndex!]
              //  contentTextView.text! = partycontentTripleArray[selectedIndex!]
                
            }
            
        }
       
    }
    
    
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
            var newParty = PartyInfo()
            return newParty
        }
    }
    
    func savePartyInfo(partyInfo:PartyInfo) {
        UserDefaults.standard.set(partyInfo, forKey: keyOfUserDefault!)
        
//        FirstViewController.sendText.append(self.firstTextField.text!)
//        FirstViewController.sendText.append(self.secondTextField.text!)
//        FirstViewController.sendText.append(self.thirdTextField.text!)
//        FirstViewController.sendText.append(self.fourthTextField.text!)
//        FirstViewController.sendText.append(self.fifthTextField.text!)
//        FirstViewController.sendText.append(self.sixthTextField.text!)

    }
    
}



/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/



//MARK: - FirstViewController

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,InputTextTableCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var recieveIndex:Int?
    
    //cellの設定
    fileprivate let RootCellIdentifier = "RootCellIdentifier"
    fileprivate let SubCellIdentifier = "SubCellIdentifier"
    fileprivate let extendedSections = NSMutableIndexSet()
    
    
    //userDafaultのデータ扱うクラス
    var saveData:SaveClass!
    var partyInfo:PartyInfo!
    
    //表示を変更するsectionのrowの数
    var rowNum:Int!
    
    //タップされたcellの行数
    var tappedCellIndex:Int!
    
    
    ///MARK: - <Normal>
    
    ///初めて画面を表示する時に呼ばれるクラス
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //editButtonItemを左に置くとnavigationで戻れなくなるよー
        //        navigationItem.leftBarButtonItem = editButtonItem
        
        self.tableView.register(TableViewRootCell.self, forCellReuseIdentifier: RootCellIdentifier)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: SubCellIdentifier)
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        
        let userDefault = UserDefaults.standard
        //下2行の意味は？
//        let appDomain:String = Bundle.main.bundleIdentifier!
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        
    }
    
    
    ///画面を表示するたびに呼ばれるクラス
    override func viewWillAppear(_ animated: Bool) {
        //扱う分類の設定 0:Single, 1:Double, 2:Triple
        saveData = SaveClass(recieveIndex: recieveIndex!)
        
        //保存してるpartyの情報を取得
        partyInfo = saveData.getPartyInfo()
        print("partyInfo::\(partyInfo)")
        //データを一時的に代入するテスト関数
        partyInfo.NameSave()
//        partyInfo.testOfDataSave()
        
    }
    
    
    //segueでの画面遷移前に呼ぶ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面に値を渡したい場合はここに書く
        let memoViewController = segue.destination as! MemoViewController
        // ここに値渡しのコード
        memoViewController.selectedIndex = tappedCellIndex
        memoViewController.saveIndex = recieveIndex
        
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
        
        //セクション数を返す, partyTitleの個数分だけのセクションを用意する
        print("partyInfo.partyTitleArray.count:\(partyInfo.partyTitleArray.count)")
        return partyInfo.partyTitleArray.count
    }
    
    ///section内のRowsの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*セクション
         true  -> numberOfRowInSection↑のrow数にする
         false -> 1にする(セクション名のところのみ)
         */
        //section名を入れる部分を追加するため+1
        rowNum = partyInfo.pokemonNameArray[section].count + 1
        
        return isSectionExtended(section) ? rowNum : 1
    }
    
    
    ///Row内のcellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
                cell.label.text = partyInfo.partyTitleArray[indexPath.section]
                //"Section \(indexPath.section)"
                cell.backgroundColor = UIColor(white: CGFloat(0.5 - 0.5 * Double(indexPath.section) / Double(tableView.numberOfSections)), alpha: 1.0)
                cell.label.textColor = UIColor.white
                
                //cellの種類に応じて内容変更。中身みて見よう。
                cell.extended = isSectionExtended(indexPath.section)
            }
        } else {
            //indexPath.rowから1引いてやらないと行数が配列の個数超えるので気をつける
            cell.textLabel?.text = partyInfo.pokemonNameArray[indexPath.section][indexPath.row-1]
            
        }
        return cell
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
    
    
    func textFieldDidEndEditing(_ cell: InputTextTableCell, value: NSString) {
        let path = tableView.indexPathForRow(at: cell.convert(cell.bounds.origin, to: tableView))
        NSLog("row = %d, value = %@", path!.row, value)
        
    }
    
    
    
}











////  FirstViewController.swift
////  ぽけメモ2
////
////  Created by マツシタ コウタロウ on 2015/12/03.
////  Copyright © 2015年 マツシタ コウタロウ. All rights reserved.
////
//
//import UIKit
//
//class FirstViewController: UIViewController , UITableViewDataSource, UITableViewDelegate,InputTextTableCellDelegate {
//    
//    @IBOutlet weak var tableView: UITableView!
//    var recieveIndex :Int!
//    
//    // セルに表示させる内容を保存した配列
////    var titleSingleArray = [String]()
////    var contentSingleArray = [String]()
////    var titleDoubleArray = [String]()
////    var contentDoubleArray = [String]()
////    var titleTripleArray = [String]()
////    var contentTripleArray = [String]()
////    var partytitleSingleArray = [String]()
////    var partycontentArray = [String]()
////    var partytitleDoubleArray = [String]()
////    var partycontentDoubleArray = [String]()
////    var partytitleTripleArray = [String]()
////    var partycontentTripleArray = [String]()
//    var titleSingleArray:[String]!//["aaaaa","aaaa","aaa","aa","a"]
//    var contentSingleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var titleDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var contentDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var titleTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var contentTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var partytitleSingleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var partycontentArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var partytitleDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var partycontentDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var partytitleTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//    var partycontentTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
//
//    let saveData: UserDefaults = UserDefaults.standard
//    fileprivate var sections: [(title: String, details: [String], extended: Bool)] = []
//    fileprivate let RootCellIdentifier = "RootCellIdentifier"
//    fileprivate let SubCellIdentifier = "SubCellIdentifier"
//    fileprivate let extendedSections = NSMutableIndexSet()
//    fileprivate var numberOfRowInSection = 5
//
//
//    
//    // 何番目のセルがタップされたかを保存しておく変数
//    var tappedCellIndex: Int?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.leftBarButtonItem = editButtonItem
//        self.tableView.register(TableViewRootCell.self, forCellReuseIdentifier: RootCellIdentifier)
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: SubCellIdentifier)
//        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
//        // Do any additional setup after loading the view, typically from a nib.
//        tableView.dataSource = self
//        tableView.delegate = self
//        
//        let userDefault = UserDefaults.standard
//        let appDomain:String = Bundle.main.bundleIdentifier!
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//    
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleSingleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentSingleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partySingleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentSingleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleDoubleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentDoubleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partyDoubleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentDoubleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleTripleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentTripleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partyTripleArray")
//        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentTripleArray")
//        //==================================
////        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "partytitleSingleArray")
////            objectForKey("partytitleSingleArray") != nil
//        //==================================
//    }
//    
//    fileprivate func didSelectRootCell(_ section: NSInteger) {
//        var extended = isSectionExtended(section)
//        extended = !extended
//        if extended {
//            extendedSections.add(section)
//        } else {
//            extendedSections.remove(section)
//        }
//        
//        let numOfRows = numberOfRowInSection
//        var paths = [IndexPath]()
//        for i in 1..<numOfRows {
//            paths.append(IndexPath(row: i, section: section))
//        }
//        //        tableView.reloadData()
//        //        tableView.reloadSections(NSIndexSet(index: section), withRowAnimation: .Automatic)
//        
//        
//        tableView.reloadData()
//        
////        tableView.beginUpdates()
////        if extended {
////            tableView.insertRowsAtIndexPaths(paths, withRowAnimation: .Automatic)
////        } else {
////            tableView.deleteRowsAtIndexPaths(paths, withRowAnimation: .Automatic)
////        }
////        tableView.endUpdates()
////        
////        UIView.animateWithDuration(0.3) { () -> Void in
////            if let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: section)) as? TableViewRootCell {
////                cell.extended = extended
////            }
////        }
//    }
//
//    fileprivate func isSectionExtended(_ section: NSInteger) -> Bool {
//        return extendedSections.contains(section)
//    }
//    
//    
//
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        if recieveIndex == 0 {
//            if UserDefaults.standard.object(forKey: "titleSingleArray") != nil {
//                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
//                titleSingleArray = UserDefaults.standard.object(forKey: "titleSingleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "contentSingleArray") != nil {
//                contentSingleArray = UserDefaults.standard.object(forKey: "contentSingleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "partytitleSingleArray") != nil {
//                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
//                titleSingleArray = UserDefaults.standard.object(forKey: "partytitleSingleArray") as! [String]
//                sections.append((title: titleSingleArray[0], details: titleSingleArray!, extended: false))
//            }
//            
//            if UserDefaults.standard.object(forKey: "partycontentSingleArray") != nil {
//                contentSingleArray = UserDefaults.standard.object(forKey: "partycontentSingleArray") as! [String]
//                
//            }
//
//            
//            
////            sections.append((title: "name", details: contentSingleArray, extended: false))
//
//            //       tableViewをリロード
//            tableView.reloadData()
//            print(titleSingleArray)
//        }
//        
//        if recieveIndex == 1 {
//            if UserDefaults.standard.object(forKey: "titleDoubleArray") != nil {
//                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
//                titleDoubleArray = UserDefaults.standard.object(forKey: "titleDoubleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "contentDoubleArray") != nil {
//                contentDoubleArray = UserDefaults.standard.object(forKey: "contentDoubleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "partytitleDoubleArray") != nil {
//                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
//                titleDoubleArray = UserDefaults.standard.object(forKey: "partytitleDoubleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "partycontentDoubleArray") != nil {
//                contentDoubleArray = UserDefaults.standard.object(forKey: "partycontentDoubleArray") as! [String]
//            }
//            
//            
//            sections.append((title: titleDoubleArray[0], details: titleDoubleArray, extended: false))
//            
//
//
//            //       tableViewをリロード
//            tableView.reloadData()
//            print(titleDoubleArray)
//        }
//        
//        if recieveIndex == 2 {
//            if UserDefaults.standard.object(forKey: "titleTripleArray") != nil {
//                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
//                titleTripleArray = UserDefaults.standard.object(forKey: "titleTripleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "contentTripleArray") != nil {
//                contentTripleArray = UserDefaults.standard.object(forKey: "contentTripleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "partytitleTripleArray") != nil {
//                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
//                titleTripleArray = UserDefaults.standard.object(forKey: "titleTripleArray") as! [String]
//            }
//            
//            if UserDefaults.standard.object(forKey: "partycontentTripleArray") != nil {
//                contentTripleArray = UserDefaults.standard.object(forKey: "partycontentTripleArray") as! [String]
//            }
//
//           sections.append((title: titleTripleArray[0], details: titleTripleArray, extended: false))
//            
//            
//            
//            //       tableViewをリロード
//            tableView.reloadData()
//            print(titleTripleArray)
//        }
//        
//    }
//    
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//     func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return 5
//    }
//    
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? CustomHeaderFooterView
//        if cell == nil {
//            cell = CustomHeaderFooterView(reuseIdentifier: "Header")
//            cell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FirstViewController.tapHeader(_:))))
//        }
//        /*cell!.textLabel!.text = self.sections[section].title*/
////        cell!.section = section
////        cell!.setExpanded(self.sections[section].extended)
//        return cell
//    }
//    
//    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
//        guard let cell = gestureRecognizer.view as? CustomHeaderFooterView else {
//            return
//        }
//        let extended = self.sections[cell.section].extended
//        self.sections[cell.section].extended = !extended
//        tableView.reloadData()  // 追記で、reloadSectionsに変更しています
//    }
//
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//     //   self.sections[section].extended ? sections[section].details.count : 0
//        if recieveIndex == 0 {
//            return titleSingleArray.count;
//        }
//        
//        if recieveIndex == 1 {
//            return titleDoubleArray.count;
//        }
//        
//        if recieveIndex == 2 {
//            return titleTripleArray.count;
//        }
//        
//        
//        return isSectionExtended(section) ? numberOfRowInSection : 1
//
//
//    }
//    
//    
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //        let cell: InputTextTableCell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath)
////        let cell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath) as UITableViewCell!
////
//        // セル内のラベルに、titleArray配列に保存されている内容を、indexPath.row(順番通りに)当てはめる
//        
//    
//            let isRoot = (indexPath.row == 0)
//            let identifier = isRoot ? RootCellIdentifier : SubCellIdentifier
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        
//            if isRoot {
//                if let cell = cell as? TableViewRootCell {
//                    cell.label.text = "Section \(indexPath.section)"
//                    cell.backgroundColor = UIColor(white: CGFloat(0.5 - 0.5 * Double(indexPath.section) / Double(tableView.numberOfSections)), alpha: 1.0)
//                    cell.label.textColor = UIColor.white
//                    cell.extended = isSectionExtended(indexPath.section)
//                }
//                return cell
//            } else {
//                if recieveIndex == 0 {
//                    cell.textLabel?.text = titleSingleArray[indexPath.row]
//                    
//                }
//                
//                if recieveIndex == 1 {
//                    cell.textLabel?.text = titleDoubleArray[indexPath.row]
//                    
//                }
//                
//                if recieveIndex == 2 {
//                    cell.textLabel?.text = titleTripleArray[indexPath.row]
//                    
//                }
//
////                cell.textLabel?.text = "indexPath(\(indexPath.section), \(indexPath.row))";
//            }
//
//        
//        
//        
//        return cell
//    }
//    
//    
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let isRoot = indexPath.row == 0
//        if isRoot {
//            return isSectionExtended(indexPath.section) ? 30 : 60
//        } else {
//            return 44
//    return InputTextTableCell.height()
//    }
//        
//    }
//    
//    
//    
//    
//    func textFieldDidEndEditing(_ cell: InputTextTableCell, value: NSString) -> () {
//        let path = tableView.indexPathForRow(at: cell.convert(cell.bounds.origin, to: tableView))
//        NSLog("row = %d, value = %@", path!.row, value)
//    }
//    
//   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        // 何番目が押されたかをtappedCellIndexに保存
////        tappedCellIndex = indexPath.row
////       
//        if indexPath.row == 0 {
//            tableView.deselectRow(at: indexPath, animated: true)
//            let isRoot = (indexPath.row == 0)
//            if isRoot {
//                didSelectRootCell(indexPath.section)
//            }
//
//        }else{
//          self.performSegue(withIdentifier: "toMemo", sender: nil)
//        }
//        
//    }
//    
//    override func setEditing(_ editing: Bool, animated: Bool) {
//        super.setEditing(editing, animated: animated)
//        tableView.isEditing = editing
//    }
//    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//        // 先にデータを更新する
//        if recieveIndex == 0 {
//            titleSingleArray.remove(at: indexPath.row)
//            print(titleSingleArray)
//            
//        }
//        
//        if recieveIndex == 1 {
//            titleDoubleArray.remove(at: indexPath.row)
//            print(titleDoubleArray)
//            
//        }
//        
//        if recieveIndex == 2 {
//            titleTripleArray.remove(at: indexPath.row)
//            print(titleTripleArray)
//            
//        }
//        
//        
//        
//        // それからテーブルの更新
//        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)],
//            with: UITableViewRowAnimation.fade)
//        if recieveIndex == 0 {
//            saveData.set(partytitleSingleArray, forKey: "partytitleSingleArray")
//            saveData.set(partycontentArray, forKey: "partycontentSingleArray")
//            saveData.set(titleSingleArray, forKey: "titleSingleArray")
//            saveData.set(contentSingleArray, forKey: "contentSingleArray")
//
//        }
//        if recieveIndex == 1 {
//            saveData.set(partytitleDoubleArray, forKey: "partytitleDoubleArray")
//            saveData.set(partycontentDoubleArray, forKey: "partycontentDoubleArray")
//            saveData.set(titleDoubleArray, forKey: "titleDoubleArray")
//            saveData.set(contentDoubleArray, forKey: "contentDoubleArray")
//
//        }
//        
//        if recieveIndex == 2 {
//            saveData.set(partytitleTripleArray, forKey: "partytitleTripleArray")
//            saveData.set(partycontentTripleArray, forKey: "partycontentTripleArray")
//            saveData.set(titleTripleArray, forKey: "titleTripleArray")
//            saveData.set(contentTripleArray, forKey: "contentTripleArray")
//        }
//        
//        
//        
//    }
//    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let targetTitle = titleSingleArray[sourceIndexPath.row]
//        
//        if let index = titleSingleArray.index(of: targetTitle) {
//            titleSingleArray.remove(at: index)
//            titleSingleArray.insert(targetTitle, at: destinationIndexPath.row)
//        }
//        let targetTitle2 = titleDoubleArray[sourceIndexPath.row]
//        if let index = titleDoubleArray.index(of: targetTitle2) {
//            titleDoubleArray.remove(at: index)
//            titleDoubleArray.insert(targetTitle2, at: destinationIndexPath.row)
//        }
//        let targetTitle3 = titleTripleArray[sourceIndexPath.row]
//        if let index = titleTripleArray.index(of: targetTitle3) {
//            titleTripleArray.remove(at: index)
//            titleTripleArray.insert(targetTitle3, at: destinationIndexPath.row)
//            
//        }
//        
//                
//    }
//    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        if tableView.isEditing {
//            return UITableViewCellEditingStyle.delete
//        } else {
//            return UITableViewCellEditingStyle.none
//        }
//        tableView.allowsSelectionDuringEditing = true
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // 次の画面に値を渡したい場合はここに書く
//        let memoViewController = segue.destination as! MemoViewController
//        // ここに値渡しのコード
//        memoViewController.selectedIndex = tappedCellIndex
//        memoViewController.saveIndex = recieveIndex
//        
//    }
//    
//
//    
//    
//    
//    
//    @IBAction func addMemo() {
//        //残ってる値のリセット
//        tappedCellIndex = nil
//        self.performSegue(withIdentifier: "toMemo", sender: nil)
//        
//    }
//    
//}
//
//    
