//
//  ForecastViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/06/23.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var sixthTextField: UITextField!
    
    var sendText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendText = self.firstTextField.text!
        sendText = self.secondTextField.text!
        sendText = self.thirdTextField.text!
        sendText = self.fourthTextField.text!
        sendText = self.fifthTextField.text!
        sendText = self.sixthTextField.text!
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
