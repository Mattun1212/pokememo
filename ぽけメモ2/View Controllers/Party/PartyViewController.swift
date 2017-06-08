//
//  FirstViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2015/12/03.
//  Copyright © 2015年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDataSource, UITableViewDelegate,InputTextTableCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var recieveIndex :Int!
    
    // セルに表示させる内容を保存した配列
//    var titleSingleArray = [String]()
//    var contentSingleArray = [String]()
//    var titleDoubleArray = [String]()
//    var contentDoubleArray = [String]()
//    var titleTripleArray = [String]()
//    var contentTripleArray = [String]()
//    var partytitleSingleArray = [String]()
//    var partycontentArray = [String]()
//    var partytitleDoubleArray = [String]()
//    var partycontentDoubleArray = [String]()
//    var partytitleTripleArray = [String]()
//    var partycontentTripleArray = [String]()
    var titleSingleArray:[String]!//["aaaaa","aaaa","aaa","aa","a"]
    var contentSingleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var titleDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var contentDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var titleTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var contentTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partytitleSingleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partycontentArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partytitleDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partycontentDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partytitleTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partycontentTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]

    let saveData: UserDefaults = UserDefaults.standard
    fileprivate var sections: [(title: String, details: [String], extended: Bool)] = []
    fileprivate let RootCellIdentifier = "RootCellIdentifier"
    fileprivate let SubCellIdentifier = "SubCellIdentifier"
    fileprivate let extendedSections = NSMutableIndexSet()
    fileprivate var numberOfRowInSection = 5


    
    // 何番目のセルがタップされたかを保存しておく変数
    var tappedCellIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        self.tableView.register(TableViewRootCell.self, forCellReuseIdentifier: RootCellIdentifier)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: SubCellIdentifier)
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        let userDefault = UserDefaults.standard
        let appDomain:String = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleSingleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentSingleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partySingleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentSingleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleDoubleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentDoubleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partyDoubleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentDoubleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleTripleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentTripleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partyTripleArray")
        userDefault.set((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentTripleArray")
        //==================================
//        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "partytitleSingleArray")
//            objectForKey("partytitleSingleArray") != nil
        //==================================
    }
    
    fileprivate func didSelectRootCell(_ section: NSInteger) {
        var extended = isSectionExtended(section)
        extended = !extended
        if extended {
            extendedSections.add(section)
        } else {
            extendedSections.remove(section)
        }
        
        let numOfRows = numberOfRowInSection
        var paths = [IndexPath]()
        for i in 1..<numOfRows {
            paths.append(IndexPath(row: i, section: section))
        }
        //        tableView.reloadData()
        //        tableView.reloadSections(NSIndexSet(index: section), withRowAnimation: .Automatic)
        
        
        tableView.reloadData()
        
//        tableView.beginUpdates()
//        if extended {
//            tableView.insertRowsAtIndexPaths(paths, withRowAnimation: .Automatic)
//        } else {
//            tableView.deleteRowsAtIndexPaths(paths, withRowAnimation: .Automatic)
//        }
//        tableView.endUpdates()
//        
//        UIView.animateWithDuration(0.3) { () -> Void in
//            if let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: section)) as? TableViewRootCell {
//                cell.extended = extended
//            }
//        }
    }

    fileprivate func isSectionExtended(_ section: NSInteger) -> Bool {
        return extendedSections.contains(section)
    }
    
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        if recieveIndex == 0 {
            if UserDefaults.standard.object(forKey: "titleSingleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleSingleArray = UserDefaults.standard.object(forKey: "titleSingleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "contentSingleArray") != nil {
                contentSingleArray = UserDefaults.standard.object(forKey: "contentSingleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "partytitleSingleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleSingleArray = UserDefaults.standard.object(forKey: "partytitleSingleArray") as! [String]
                sections.append((title: titleSingleArray[0], details: titleSingleArray!, extended: false))
            }
            
            if UserDefaults.standard.object(forKey: "partycontentSingleArray") != nil {
                contentSingleArray = UserDefaults.standard.object(forKey: "partycontentSingleArray") as! [String]
                
            }

            
            
//            sections.append((title: "name", details: contentSingleArray, extended: false))

            //       tableViewをリロード
            tableView.reloadData()
            print(titleSingleArray)
        }
        
        if recieveIndex == 1 {
            if UserDefaults.standard.object(forKey: "titleDoubleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleDoubleArray = UserDefaults.standard.object(forKey: "titleDoubleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "contentDoubleArray") != nil {
                contentDoubleArray = UserDefaults.standard.object(forKey: "contentDoubleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "partytitleDoubleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleDoubleArray = UserDefaults.standard.object(forKey: "partytitleDoubleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "partycontentDoubleArray") != nil {
                contentDoubleArray = UserDefaults.standard.object(forKey: "partycontentDoubleArray") as! [String]
            }
            
            
            sections.append((title: titleDoubleArray[0], details: titleDoubleArray, extended: false))
            


            //       tableViewをリロード
            tableView.reloadData()
            print(titleDoubleArray)
        }
        
        if recieveIndex == 2 {
            if UserDefaults.standard.object(forKey: "titleTripleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleTripleArray = UserDefaults.standard.object(forKey: "titleTripleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "contentTripleArray") != nil {
                contentTripleArray = UserDefaults.standard.object(forKey: "contentTripleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "partytitleTripleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleTripleArray = UserDefaults.standard.object(forKey: "titleTripleArray") as! [String]
            }
            
            if UserDefaults.standard.object(forKey: "partycontentTripleArray") != nil {
                contentTripleArray = UserDefaults.standard.object(forKey: "partycontentTripleArray") as! [String]
            }

           sections.append((title: titleTripleArray[0], details: titleTripleArray, extended: false))
            
            
            
            //       tableViewをリロード
            tableView.reloadData()
            print(titleTripleArray)
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? CustomHeaderFooterView
        if cell == nil {
            cell = CustomHeaderFooterView(reuseIdentifier: "Header")
            cell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FirstViewController.tapHeader(_:))))
        }
        /*cell!.textLabel!.text = self.sections[section].title*/
//        cell!.section = section
//        cell!.setExpanded(self.sections[section].extended)
        return cell
    }
    
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CustomHeaderFooterView else {
            return
        }
        let extended = self.sections[cell.section].extended
        self.sections[cell.section].extended = !extended
        tableView.reloadData()  // 追記で、reloadSectionsに変更しています
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   self.sections[section].extended ? sections[section].details.count : 0
        if recieveIndex == 0 {
            return titleSingleArray.count;
        }
        
        if recieveIndex == 1 {
            return titleDoubleArray.count;
        }
        
        if recieveIndex == 2 {
            return titleTripleArray.count;
        }
        
        
        return isSectionExtended(section) ? numberOfRowInSection : 1


    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell: InputTextTableCell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath)
//        let cell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath) as UITableViewCell!
//
        // セル内のラベルに、titleArray配列に保存されている内容を、indexPath.row(順番通りに)当てはめる
        
    
            let isRoot = (indexPath.row == 0)
            let identifier = isRoot ? RootCellIdentifier : SubCellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
            if isRoot {
                if let cell = cell as? TableViewRootCell {
                    cell.label.text = "Section \(indexPath.section)"
                    cell.backgroundColor = UIColor(white: CGFloat(0.5 - 0.5 * Double(indexPath.section) / Double(tableView.numberOfSections)), alpha: 1.0)
                    cell.label.textColor = UIColor.white
                    cell.extended = isSectionExtended(indexPath.section)
                }
                return cell
            } else {
                if recieveIndex == 0 {
                    cell.textLabel?.text = titleSingleArray[indexPath.row]
                    
                }
                
                if recieveIndex == 1 {
                    cell.textLabel?.text = titleDoubleArray[indexPath.row]
                    
                }
                
                if recieveIndex == 2 {
                    cell.textLabel?.text = titleTripleArray[indexPath.row]
                    
                }

//                cell.textLabel?.text = "indexPath(\(indexPath.section), \(indexPath.row))";
            }

        
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isRoot = indexPath.row == 0
        if isRoot {
            return isSectionExtended(indexPath.section) ? 30 : 60
        } else {
            return 44
    return InputTextTableCell.height()
    }
        
    }
    
    
    
    
    func textFieldDidEndEditing(_ cell: InputTextTableCell, value: NSString) -> () {
        let path = tableView.indexPathForRow(at: cell.convert(cell.bounds.origin, to: tableView))
        NSLog("row = %d, value = %@", path!.row, value)
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // 何番目が押されたかをtappedCellIndexに保存
//        tappedCellIndex = indexPath.row
//       
        if indexPath.row == 0 {
            tableView.deselectRow(at: indexPath, animated: true)
            let isRoot = (indexPath.row == 0)
            if isRoot {
                didSelectRootCell(indexPath.section)
            }

        }else{
          self.performSegue(withIdentifier: "toMemo", sender: nil)
        }
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // 先にデータを更新する
        if recieveIndex == 0 {
            titleSingleArray.remove(at: indexPath.row)
            print(titleSingleArray)
            
        }
        
        if recieveIndex == 1 {
            titleDoubleArray.remove(at: indexPath.row)
            print(titleDoubleArray)
            
        }
        
        if recieveIndex == 2 {
            titleTripleArray.remove(at: indexPath.row)
            print(titleTripleArray)
            
        }
        
        
        
        // それからテーブルの更新
        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)],
            with: UITableViewRowAnimation.fade)
        if recieveIndex == 0 {
            saveData.set(partytitleSingleArray, forKey: "partytitleSingleArray")
            saveData.set(partycontentArray, forKey: "partycontentSingleArray")
            saveData.set(titleSingleArray, forKey: "titleSingleArray")
            saveData.set(contentSingleArray, forKey: "contentSingleArray")

        }
        if recieveIndex == 1 {
            saveData.set(partytitleDoubleArray, forKey: "partytitleDoubleArray")
            saveData.set(partycontentDoubleArray, forKey: "partycontentDoubleArray")
            saveData.set(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.set(contentDoubleArray, forKey: "contentDoubleArray")

        }
        
        if recieveIndex == 2 {
            saveData.set(partytitleTripleArray, forKey: "partytitleTripleArray")
            saveData.set(partycontentTripleArray, forKey: "partycontentTripleArray")
            saveData.set(titleTripleArray, forKey: "titleTripleArray")
            saveData.set(contentTripleArray, forKey: "contentTripleArray")
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let targetTitle = titleSingleArray[sourceIndexPath.row]
        
        if let index = titleSingleArray.index(of: targetTitle) {
            titleSingleArray.remove(at: index)
            titleSingleArray.insert(targetTitle, at: destinationIndexPath.row)
        }
        let targetTitle2 = titleDoubleArray[sourceIndexPath.row]
        if let index = titleDoubleArray.index(of: targetTitle2) {
            titleDoubleArray.remove(at: index)
            titleDoubleArray.insert(targetTitle2, at: destinationIndexPath.row)
        }
        let targetTitle3 = titleTripleArray[sourceIndexPath.row]
        if let index = titleTripleArray.index(of: targetTitle3) {
            titleTripleArray.remove(at: index)
            titleTripleArray.insert(targetTitle3, at: destinationIndexPath.row)
            
        }
        
                
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return UITableViewCellEditingStyle.delete
        } else {
            return UITableViewCellEditingStyle.none
        }
        tableView.allowsSelectionDuringEditing = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面に値を渡したい場合はここに書く
        let memoViewController = segue.destination as! MemoViewController
        // ここに値渡しのコード
        memoViewController.selectedIndex = tappedCellIndex
        memoViewController.saveIndex = recieveIndex
        
    }
    

    
    
    
    
    @IBAction func addMemo() {
        //残ってる値のリセット
        tappedCellIndex = nil
        self.performSegue(withIdentifier: "toMemo", sender: nil)
        
    }
    
}

    
