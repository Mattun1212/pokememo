//
//  MemoViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/01/28.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit
import RealmSwift

class MemoViewController: UIViewController ,UITextFieldDelegate {
    
    var selectedIndex: Int?
    var saveIndex: Int!
    
    var saveData:SaveClass!
    var partyInfo: PartyInfo = PartyInfo()
    
    var savedPartyInfo:Results<PartyInfo>?
    
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var sixthTextField: UITextField!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    

    //最初に画面が表示されたら呼ばれるとこ
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        fifthTextField.delegate = self
        sixthTextField.delegate = self
        
    }
    
    //画面が表示されるたびに呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        //データの取得の初期設定
        saveData = SaveClass(recieveIndex: saveIndex)
        
    }
    
    //Saveボタンが押されたら
    @IBAction func tappedSaveButton(){
        
        //partyInfoに保存する情報を入れていく partyInfo.????で保存先を呼び出す
        
        partyInfo.partyType = saveData.partyType!
        partyInfo.partyTitle = titleTextField.text!
        partyInfo.partyComment = contentTextView.text
        
        //ポケモンの名前を配列みたいに入れていく
        for i in 0..<6{
            //まずPokemonのクラスを用意
            let pokemon:Pokemon? = Pokemon()
            
            //まず1つ.nameに入れていく
            switch i {
            case 0:
                pokemon?.name = firstTextField.text!
            case 1:
                pokemon?.name = secondTextField.text!
            case 2:
                pokemon?.name = thirdTextField.text!
            case 3:
                pokemon?.name = fourthTextField.text!
            case 4:
                pokemon?.name = fifthTextField.text!
            case 5:
                pokemon?.name = sixthTextField.text!
            default:
                break
            }
            
            //入れた let pomemonをpokemonsって配列<List>に追加する
            partyInfo.pokemons.append(pokemon!)
        }
        
        //全部情報入れたら保存する
        saveData.savePartyInfo(partyInfo: partyInfo)
        
        
        
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }

}

    





