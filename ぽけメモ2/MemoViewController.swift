//
//  MemoViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/01/28.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController ,UITextFieldDelegate {
    
    var selectedIndex: Int?
    var titleArray = [String]()
    var contentArray = [String]()
    var tappedCellIndex: Int = 0
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleArray = saveData.arrayForKey("titleArray") as! [String]
        contentArray = saveData.arrayForKey("contentArray") as! [String]
        
        if selectedIndex != nil{
            titleTextField.text! = titleArray[selectedIndex!]
            contentTextView.text! = contentArray[selectedIndex!]

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    
    override func viewWillDisappear(animated: Bool) {
        //　別の画面に移る直前の処理
        
        if selectedIndex != nil {
//            titleTextFieldの値がnilでない時、selectedIndex番目の値を変更する
            
           titleArray[selectedIndex!] = titleTextField.text!
           contentArray[selectedIndex!] = contentTextView.text!
            
        }else if selectedIndex == nil {
//    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
            titleArray.append(titleTextField.text!)
            contentArray.append(contentTextView.text!)
 
        }
        
        
        if titleTextField.text != ""{
            saveData.setObject(titleArray, forKey: "titleArray")
            saveData.setObject(contentArray, forKey: "contentArray")

        }
        
    
        
    }

}

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


