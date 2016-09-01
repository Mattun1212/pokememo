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
    
    // セルに表示させる内容を保存した配列
    var titleArray = [String]()
    var contentArray = [String]()
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
        if NSUserDefaults.standardUserDefaults().objectForKey("titleArray") != nil {
//            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
            titleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleArray") as! [String]
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("contentArray") != nil {
            contentArray = NSUserDefaults.standardUserDefaults().objectForKey("contentArray") as! [String]
        }
//       tableViewをリロード
       tableView.reloadData()
        print(titleArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let cell: InputTextTableCell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath) as UITableViewCell!
        
        // セル内のラベルに、titleArray配列に保存されている内容を、indexPath.row(順番通りに)当てはめる
        cell.textLabel?.text = titleArray[indexPath.row]
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
        titleArray.removeAtIndex(indexPath.row)
        print(titleArray)
        // それからテーブルの更新
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row, inSection: 0)],
            withRowAnimation: UITableViewRowAnimation.Fade)
        
        saveData.setObject(titleArray, forKey: "titleArray")
        saveData.setObject(contentArray, forKey: "contentArray")
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let targetTitle = titleArray[sourceIndexPath.row]
        if let index = titleArray.indexOf(targetTitle) {
            titleArray.removeAtIndex(index)
            titleArray.insert(targetTitle, atIndex: destinationIndexPath.row)
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
    }
    
    @IBAction func addMemo() {
        //残ってる値のリセット
        tappedCellIndex = nil
        self.performSegueWithIdentifier("toMemo", sender: nil)
        
    }
    
}