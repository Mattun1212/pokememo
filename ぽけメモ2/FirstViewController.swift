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
    var titleSingleArray = [String]()
    var contentSingleArray = [String]()
    var titleDoubleArray = [String]()
    var contentDoubleArray = [String]()
    var titleTripleArray = [String]()
    var contentTripleArray = [String]()
    var titleRoutationArray = [String]()
    var contentRoutationArray = [String]()
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    // 何番目のセルがタップされたかを保存しておく変数
    var tappedCellIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if recieveIndex == 0 {
            if NSUserDefaults.standardUserDefaults().objectForKey("titleSingleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleSingleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleSingleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("contentSingleArray") != nil {
                contentSingleArray = NSUserDefaults.standardUserDefaults().objectForKey("contentSingleArray") as! [String]
            }
            //       tableViewをリロード
            tableView.reloadData()
            print(titleSingleArray)
        }
        
        if recieveIndex == 1 {
            if NSUserDefaults.standardUserDefaults().objectForKey("titleDoubleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleDoubleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleDoubleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("contentDoubleArray") != nil {
                contentDoubleArray = NSUserDefaults.standardUserDefaults().objectForKey("contentDoubleArray") as! [String]
            }
            //       tableViewをリロード
            tableView.reloadData()
            print(titleDoubleArray)
        }
        
        if recieveIndex == 2 {
            if NSUserDefaults.standardUserDefaults().objectForKey("titleTripleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleTripleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleTripleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("contentTripleArray") != nil {
                contentTripleArray = NSUserDefaults.standardUserDefaults().objectForKey("contentTripleArray") as! [String]
            }
            //       tableViewをリロード
            tableView.reloadData()
            print(titleTripleArray)
        }
        
        if recieveIndex == 3{
            if NSUserDefaults.standardUserDefaults().objectForKey("titleRoutationArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleRoutationArray = NSUserDefaults.standardUserDefaults().objectForKey("titleRoutationArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("contentRoutationArray") != nil {
                contentRoutationArray = NSUserDefaults.standardUserDefaults().objectForKey("contentRoutationArray") as! [String]
            }
            //       tableViewをリロード
            tableView.reloadData()
            print(titleRoutationArray)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recieveIndex == 0 {
            return titleSingleArray.count;
        }
        
        if recieveIndex == 1 {
            return titleDoubleArray.count;
        }
        
        if recieveIndex == 2 {
            return titleTripleArray.count;
        }
        
        if recieveIndex == 3 {
            return titleRoutationArray.count;
        }
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let cell: InputTextTableCell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath) as UITableViewCell!
        
        // セル内のラベルに、titleArray配列に保存されている内容を、indexPath.row(順番通りに)当てはめる
        if recieveIndex == 0 {
            cell.textLabel?.text = titleSingleArray[indexPath.row]
            
        }
        
        if recieveIndex == 1 {
            cell.textLabel?.text = titleDoubleArray[indexPath.row]
            
        }
        
        if recieveIndex == 2 {
            cell.textLabel?.text = titleTripleArray[indexPath.row]
            
        }
        
        if recieveIndex == 3 {
            cell.textLabel?.text = titleRoutationArray[indexPath.row]
            
        }
        
        
        return cell
    }
    
    /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return InputTextTableCell.height()
    }
    */
    
    func textFieldDidEndEditing(cell: InputTextTableCell, value: NSString) -> () {
        let path = tableView.indexPathForRowAtPoint(cell.convertPoint(cell.bounds.origin, toView: tableView))
        NSLog("row = %d, value = %@", path!.row, value)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        // 何番目が押されたかをtappedCellIndexに保存
        tappedCellIndex = indexPath.row
        
        self.performSegueWithIdentifier("toMemo", sender: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 先にデータを更新する
        if recieveIndex == 0 {
            titleSingleArray.removeAtIndex(indexPath.row)
            print(titleSingleArray)
            
        }
        
        if recieveIndex == 1 {
            titleDoubleArray.removeAtIndex(indexPath.row)
            print(titleDoubleArray)
            
        }
        
        if recieveIndex == 2 {
            titleTripleArray.removeAtIndex(indexPath.row)
            print(titleTripleArray)
            
        }
        
        if recieveIndex == 3 {
            titleRoutationArray.removeAtIndex(indexPath.row)
            print(titleRoutationArray)
            
        }
        
        
        // それからテーブルの更新
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row, inSection: 0)],
            withRowAnimation: UITableViewRowAnimation.Fade)
        if recieveIndex == 0 {
            saveData.setObject(titleSingleArray, forKey: "titleSingleArray")
            saveData.setObject(contentSingleArray, forKey: "contentSingleArray")
        }
        if recieveIndex == 1 {
            saveData.setObject(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.setObject(contentDoubleArray, forKey: "contentDoubleArray")
        }
        
        if recieveIndex == 2 {
            saveData.setObject(titleTripleArray, forKey: "titleTripleArray")
            saveData.setObject(contentTripleArray, forKey: "contentTripleArray")
        }
        
        if recieveIndex == 3 {
            saveData.setObject(titleRoutationArray, forKey: "titleRoutationArray")
            saveData.setObject(contentRoutationArray, forKey: "contentRoutationArray")
        }
        
        
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let targetTitle = titleSingleArray[sourceIndexPath.row]
        
        if let index = titleSingleArray.indexOf(targetTitle) {
            titleSingleArray.removeAtIndex(index)
            titleSingleArray.insert(targetTitle, atIndex: destinationIndexPath.row)
        }
        let targetTitle2 = titleDoubleArray[sourceIndexPath.row]
        if let index = titleDoubleArray.indexOf(targetTitle2) {
            titleDoubleArray.removeAtIndex(index)
            titleDoubleArray.insert(targetTitle2, atIndex: destinationIndexPath.row)
        }
        let targetTitle3 = titleTripleArray[sourceIndexPath.row]
        if let index = titleTripleArray.indexOf(targetTitle3) {
            titleTripleArray.removeAtIndex(index)
            titleTripleArray.insert(targetTitle3, atIndex: destinationIndexPath.row)
            
        }
        
        let targetTitle4 = titleRoutationArray[sourceIndexPath.row]
        if let index = titleRoutationArray.indexOf(targetTitle4) {
            titleRoutationArray.removeAtIndex(index)
            titleRoutationArray.insert(targetTitle4, atIndex: destinationIndexPath.row)
            
        }
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return UITableViewCellEditingStyle.Delete
        } else {
            return UITableViewCellEditingStyle.None
        }
        tableView.allowsSelectionDuringEditing = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 次の画面に値を渡したい場合はここに書く
        let memoViewController = segue.destinationViewController as! MemoViewController
        // ここに値渡しのコード
        memoViewController.selectedIndex = tappedCellIndex
        memoViewController.saveIndex = recieveIndex
    }
    
    
    
    @IBAction func addMemo() {
        //残ってる値のリセット
        tappedCellIndex = nil
        self.performSegueWithIdentifier("toMemo", sender: nil)
        
    }
    
}