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
    var partytitleSingleArray = [String]()
    var partycontentSingleArray = [String]()
    var partytitleDoubleArray = [String]()
    var partycontentDoubleArray = [String]()
    var partytitleTripleArray = [String]()
    var partycontentTripleArray = [String]()
    var tappedCellIndex: Int = 0
    var saveIndex: Int!
    
    
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var sixthTextField: UITextField!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveIndex == 0 {
        if saveData.array(forKey: "titleSingleArray") != nil {
            titleSingleArray = saveData.array(forKey: "titleSingleArray") as! [String]
            contentSingleArray = saveData.array(forKey: "contentSingleArray") as! [String]
        }
       
        
        if selectedIndex != nil{
            titleTextField.text! = titleSingleArray[selectedIndex!]
            contentTextView.text! = contentSingleArray[selectedIndex!]

        }
            if saveData.array(forKey: "partytitleSingleArray") != nil {
                titleSingleArray = saveData.array(forKey: "partytitleSingleArray") as! [String]
                contentSingleArray = saveData.array(forKey: "partycontentSingleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partytitleSingleArray[selectedIndex!]
                contentTextView.text! = partycontentSingleArray[selectedIndex!]
                
            }

        
    }
        if saveIndex == 1 {
            if saveData.array(forKey: "titleDoubleArray") != nil {
                titleDoubleArray = saveData.array(forKey: "titleDoubleArray") as! [String]
                contentDoubleArray = saveData.array(forKey: "contentDoubleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = titleDoubleArray[selectedIndex!]
                contentTextView.text! = contentDoubleArray[selectedIndex!]
                
            }
            
            if saveData.array(forKey: "partytitleDoubleArray") != nil {
                titleDoubleArray = saveData.array(forKey: "partytitleDoubleArray") as! [String]
                contentDoubleArray = saveData.array(forKey: "partycontentDoubleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partytitleDoubleArray[selectedIndex!]
                contentTextView.text! = partycontentDoubleArray[selectedIndex!]
                
            }

            
        }
        if saveIndex == 2 {
            if saveData.array(forKey: "titleTripleArray") != nil {
                titleTripleArray = saveData.array(forKey: "titleTripleArray") as! [String]
                contentTripleArray = saveData.array(forKey: "contentTripleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = titleTripleArray[selectedIndex!]
                contentTextView.text! = contentTripleArray[selectedIndex!]
                
            }
            
            if saveData.array(forKey: "partytitleTripleArray") != nil {
                titleTripleArray = saveData.array(forKey: "partytitleTripleArray") as! [String]
                contentTripleArray = saveData.array(forKey: "partycontentTripleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partytitleTripleArray[selectedIndex!]
                contentTextView.text! = partycontentTripleArray[selectedIndex!]
                
            }

        }
        
        
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    
    override func viewWillDisappear(_ animated: Bool) {
        //　別の画面に移る直前の処理
        
       
            if saveIndex == 0 {
                if selectedIndex != nil {
                    titleSingleArray[selectedIndex!] = titleTextField.text!
                    contentSingleArray[selectedIndex!] = contentTextView.text!
                
                if titleTextField.text != ""{
                    saveData.set(titleSingleArray, forKey: "titleSingleArray")
                    saveData.set(contentSingleArray, forKey: "contentSingleArray")
                    
                }

                }else if selectedIndex == nil {
                //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                titleSingleArray.append(titleTextField.text!)
                contentSingleArray.append(contentTextView.text!)
                saveData.set(titleSingleArray, forKey: "titleSingleArray")
                saveData.set(contentSingleArray, forKey: "contentSingleArray")
    
            }
                if selectedIndex != nil {
                    partytitleSingleArray[selectedIndex!] = titleTextField.text!
                    partycontentSingleArray[selectedIndex!] = contentTextView.text!
                    
                    if titleTextField.text != ""{
                        saveData.set(partytitleSingleArray, forKey: "partytitleSingleArray")
                        saveData.set(partycontentSingleArray, forKey: "partycontentSingleArray")
                        
                    }
                    
                }else if selectedIndex == nil {
                    //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                    partytitleSingleArray.append(titleTextField.text!)
                    partycontentSingleArray.append(contentTextView.text!)
                    saveData.set(partytitleSingleArray, forKey: "partytitleSingleArray")
                    saveData.set(partycontentSingleArray, forKey: "partycontentSingleArray")
                    
                }

            
            
           
        }
        
        if saveIndex == 1 {
            if selectedIndex != nil {
            titleDoubleArray[selectedIndex!] = titleTextField.text!
            contentDoubleArray[selectedIndex!] = contentTextView.text!
                
            if titleTextField.text != ""{
            saveData.set(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.set(contentDoubleArray, forKey: "contentDoubleArray")
                    
                }

        }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
            titleDoubleArray.append(titleTextField.text!)
            contentDoubleArray.append(contentTextView.text!)
            saveData.set(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.set(contentDoubleArray, forKey: "contentDoubleArray")

        }
            
            if selectedIndex != nil {
                partytitleDoubleArray[selectedIndex!] = titleTextField.text!
                partycontentDoubleArray[selectedIndex!] = contentTextView.text!
                
                if titleTextField.text != ""{
                    saveData.set(partytitleDoubleArray, forKey: "partytitleDoubleArray")
                    saveData.set(partycontentDoubleArray, forKey: "partycontentDoubleArray")
                    
                }
                
            }else if selectedIndex == nil {
                //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                partytitleDoubleArray.append(titleTextField.text!)
                partycontentDoubleArray.append(contentTextView.text!)
                saveData.set(partytitleDoubleArray, forKey: "partytitleDoubleArray")
                saveData.set(partycontentDoubleArray, forKey: "partycontentDoubleArray")
                
            }

        
            
    }

    if saveIndex == 2 {
        if selectedIndex != nil {
            titleTripleArray[selectedIndex!] = titleTextField.text!
            contentTripleArray[selectedIndex!] = contentTextView.text!
            
            if titleTextField.text != ""{
                saveData.set(titleTripleArray, forKey: "titleTripleArray")
                saveData.set(contentTripleArray, forKey: "contentTripleArray")
                
            }

            }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                titleTripleArray.append(titleTextField.text!)
                contentTripleArray.append(contentTextView.text!)
                saveData.set(titleTripleArray, forKey: "titleTripleArray")
                saveData.set(contentTripleArray, forKey: "contentTripleArray")

            }
        
        if selectedIndex != nil {
            partytitleTripleArray[selectedIndex!] = titleTextField.text!
            partycontentTripleArray[selectedIndex!] = contentTextView.text!
            
            if titleTextField.text != ""{
                saveData.set(partytitleTripleArray, forKey: "partytitleTripleArray")
                saveData.set(partycontentTripleArray, forKey: "partycontentTripleArray")
                
            }
            
        }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
            partytitleTripleArray.append(titleTextField.text!)
            partycontentTripleArray.append(contentTextView.text!)
            saveData.set(partytitleTripleArray, forKey: "partytitleTripleArray")
            saveData.set(partycontentTripleArray, forKey: "partycontentTripleArray")
            
        }


        }

    
    }


    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }

}

    





