//
//  MemoViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/01/28.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit
    
    class MemoViewController: UIViewController ,UITextFieldDelegate{
        
        @IBOutlet var titleTextField: UITextField!
        @IBOutlet var contentTextView: UITextView!
        
        let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            titleTextField.text = saveData.objectForKey("title") as! String?
            contentTextView.text = saveData.objectForKey("content") as! String?
            
            titleTextField.delegate = self
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func saveMeno() {
            saveData.setObject(titleTextField.text, forKey: "title")
            saveData.setObject(contentTextView.text, forKey: "content")
            saveData.synchronize()
            
            let alert = UIAlertController(title: "保存" ,
                message: "メモの保存が完了しました。",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: {action in
                        self.navigationController?.popViewControllerAnimated(true)
                        NSLog("OKボタンが押されました！")
                    }
                )
            )
            
            presentViewController(alert, animated: true, completion: nil)
        }
        func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
}
