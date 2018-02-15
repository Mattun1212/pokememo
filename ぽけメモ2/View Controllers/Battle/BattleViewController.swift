//
//  SecondViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2015/12/03.
//  Copyright © 2015年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
   
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var sixthTextField: UITextField!
    @IBOutlet var partydivide: UISegmentedControl!
    @IBOutlet var button: UIButton!
    var identifier = "SecondView"
    var firstArray = [String]()
    var secondArray = [String]()
    var thirdArray = [String]()
    var fourthArray = [String]()
    var fifthArray = [String]()
    var sixthArray = [String]()
    var iconload = IconLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        fifthTextField.delegate = self
        sixthTextField.delegate = self
        iconload.loadcsv()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func partydivide(_ sender: UISegmentedControl) {
        
        print(sender.selectedSegmentIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            identifier = "SecondView"
        case 1:
            identifier = "Double"
        case 2:
            identifier = "Double"
        default:
            identifier = "SecondView"
        }
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Double"{
            let forecastDoubleViewController = segue.destination as! ForecastDoubleViewController
    
            forecastDoubleViewController.sendText.append(self.firstTextField.text!)
            forecastDoubleViewController.sendText.append(self.secondTextField.text!)
            forecastDoubleViewController.sendText.append(self.thirdTextField.text!)
            forecastDoubleViewController.sendText.append(self.fourthTextField.text!)
            forecastDoubleViewController.sendText.append(self.fifthTextField.text!)
            forecastDoubleViewController.sendText.append(self.sixthTextField.text!)
            
        }
        
        
        
        if  segue.identifier == "SecondView" {
            let SecondViewController = segue.destination as! ForecastViewController
            
            SecondViewController.sendText.append(self.firstTextField.text!)
            SecondViewController.sendText.append(self.secondTextField.text!)
            SecondViewController.sendText.append(self.thirdTextField.text!)
            SecondViewController.sendText.append(self.fourthTextField.text!)
            SecondViewController.sendText.append(self.fifthTextField.text!)
            SecondViewController.sendText.append(self.sixthTextField.text!)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
        thirdTextField.resignFirstResponder()
        fourthTextField.resignFirstResponder()
        fifthTextField.resignFirstResponder()
        sixthTextField.resignFirstResponder()
    
        return true
    }
    
    
    
 
    
    
    @IBAction func button(_ sender: UIButton) {
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

