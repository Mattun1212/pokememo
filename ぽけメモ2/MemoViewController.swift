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
    var titleSingleArray = [String]()
    var contentSingleArray = [String]()
    var titleDoubleArray = [String]()
    var contentDoubleArray = [String]()
    var titleTripleArray = [String]()
    var contentTripleArray = [String]()
    var titleRoutationArray = [String]()
    var contentRoutationArray = [String]()
    var tappedCellIndex: Int = 0
    var saveIndex: Int!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveIndex == 0 {
        if saveData.arrayForKey("titleSingleArray") != nil {
            titleSingleArray = saveData.arrayForKey("titleSingleArray") as! [String]
            contentSingleArray = saveData.arrayForKey("contentSingleArray") as! [String]
        }
       
        
        if selectedIndex != nil{
            titleTextField.text! = titleSingleArray[selectedIndex!]
            contentTextView.text! = contentSingleArray[selectedIndex!]

        }
        
    }
        if saveIndex == 1 {
            if saveData.arrayForKey("titleDoubleArray") != nil {
                titleDoubleArray = saveData.arrayForKey("titleDoubleArray") as! [String]
                contentDoubleArray = saveData.arrayForKey("contentDoubleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = titleDoubleArray[selectedIndex!]
                contentTextView.text! = contentDoubleArray[selectedIndex!]
                
            }
            
        }
        if saveIndex == 2 {
            if saveData.arrayForKey("titleTripleArray") != nil {
                titleTripleArray = saveData.arrayForKey("titleTripleArray") as! [String]
                contentTripleArray = saveData.arrayForKey("contentTripleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = titleTripleArray[selectedIndex!]
                contentTextView.text! = contentTripleArray[selectedIndex!]
                
            }
            
        }
        if saveIndex == 3 {
            if saveData.arrayForKey("titleRoutationArray") != nil {
                titleRoutationArray = saveData.arrayForKey("titleRoutationArray") as! [String]
                contentRoutationArray = saveData.arrayForKey("contentRoutationArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = titleRoutationArray[selectedIndex!]
                contentTextView.text! = contentRoutationArray[selectedIndex!]
                
            }
            
        }

        
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    
    override func viewWillDisappear(animated: Bool) {
        //　別の画面に移る直前の処理
        
       
            if saveIndex == 0 {
                if selectedIndex != nil {
                    titleSingleArray[selectedIndex!] = titleTextField.text!
                    contentSingleArray[selectedIndex!] = contentTextView.text!
                
                if titleTextField.text != ""{
                    saveData.setObject(titleSingleArray, forKey: "titleSingleArray")
                    saveData.setObject(contentSingleArray, forKey: "contentSingleArray")
                    
                }

                }else if selectedIndex == nil {
                //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                titleSingleArray.append(titleTextField.text!)
                contentSingleArray.append(contentTextView.text!)
                saveData.setObject(titleSingleArray, forKey: "titleSingleArray")
                saveData.setObject(contentSingleArray, forKey: "contentSingleArray")
    
            }
            
            
           
        }
        
        if saveIndex == 1 {
            if selectedIndex != nil {
            titleDoubleArray[selectedIndex!] = titleTextField.text!
            contentDoubleArray[selectedIndex!] = contentTextView.text!
                
            if titleTextField.text != ""{
            saveData.setObject(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.setObject(contentDoubleArray, forKey: "contentDoubleArray")
                    
                }

        }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
            titleDoubleArray.append(titleTextField.text!)
            contentDoubleArray.append(contentTextView.text!)
            saveData.setObject(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.setObject(contentDoubleArray, forKey: "contentDoubleArray")

        }
        
        
            
    }

    if saveIndex == 2 {
        if selectedIndex != nil {
            titleTripleArray[selectedIndex!] = titleTextField.text!
            contentTripleArray[selectedIndex!] = contentTextView.text!
            
            if titleTextField.text != ""{
                saveData.setObject(titleTripleArray, forKey: "titleTripleArray")
                saveData.setObject(contentTripleArray, forKey: "contentTripleArray")
                
            }

            }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                titleTripleArray.append(titleTextField.text!)
                contentTripleArray.append(contentTextView.text!)
                saveData.setObject(titleTripleArray, forKey: "titleTripleArray")
                saveData.setObject(contentTripleArray, forKey: "contentTripleArray")

            }

        }

    
    if saveIndex == 3 {
         if selectedIndex != nil {
            titleRoutationArray[selectedIndex!] = titleTextField.text!
            contentRoutationArray[selectedIndex!] = contentTextView.text!
            if titleTextField.text != ""{
                saveData.setObject(titleRoutationArray, forKey: "titleRoutationArray")
                saveData.setObject(contentRoutationArray, forKey: "contentRoutationArray")
                
            }

            }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                titleRoutationArray.append(titleTextField.text!)
                contentRoutationArray.append(contentTextView.text!)
                saveData.setObject(titleRoutationArray, forKey: "titleRoutationArray")
                saveData.setObject(contentRoutationArray, forKey: "contentRoutationArray")

            }
        }
    }


    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }

}

    





