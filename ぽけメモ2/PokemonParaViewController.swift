//
//  MemoViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/01/28.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit
import RealmSwift

class PokemonParaViewController: UIViewController ,UITextFieldDelegate {
    
    var selectedIndex: Int?
    var saveIndex: Int!
    
    var saveData:SaveClass!
    var partyInfo: PartyInfo = PartyInfo()
    
    var savedPartyInfo:Results<PartyInfo>?
    
    
    @IBOutlet weak var firstmoveTextField: UITextField!
    @IBOutlet weak var secondmoveTextField: UITextField!
    @IBOutlet weak var thirdmoveTextField: UITextField!
    @IBOutlet weak var fourthmoveTextField: UITextField!
    
    @IBOutlet weak var abilityTextField: UITextField!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var natureTextField: UITextField!
    @IBOutlet weak var firstEVTextField: UITextField!
    @IBOutlet weak var secondEVTextField: UITextField!
    @IBOutlet weak var thirdEVTextField: UITextField!
    @IBOutlet weak var fourthEVTextField: UITextField!
    @IBOutlet weak var fifthEVTextField: UITextField!
    @IBOutlet weak var sixthEVTextField: UITextField!
    

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    
    //最初に画面が表示されたら呼ばれるとこ
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstmoveTextField.delegate = self
        secondmoveTextField.delegate = self
        thirdmoveTextField.delegate = self
        fourthmoveTextField.delegate = self
        abilityTextField.delegate = self
        itemTextField.delegate = self
        firstEVTextField.delegate = self
        secondEVTextField.delegate = self
        thirdEVTextField.delegate = self
        fourthEVTextField.delegate = self
        fifthEVTextField.delegate = self
        sixthEVTextField.delegate = self
        
        
        
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
        for i in 0..<9{
            //まずPokemonのクラスを用意
            let pokemon:Pokemon? = Pokemon()
            
            //まず1つ.nameに入れていく
            switch i {
            case 0:
                pokemon?.move = firstmoveTextField.text!
            case 1:
                pokemon?.move = secondmoveTextField.text!
            case 2:
                pokemon?.move = thirdmoveTextField.text!
            case 3:
                pokemon?.move = fourthmoveTextField.text!
            case 4:
                pokemon?.EV =   firstEVTextField.text!
            case 5:
                pokemon?.EV =   secondEVTextField.text!
            case 6:
                pokemon?.EV =   thirdEVTextField.text!
            case 7:
                pokemon?.EV =   fourthEVTextField.text!
            case 8:
                pokemon?.EV =   fifthEVTextField.text!
            case 9:
                pokemon?.EV =   sixthEVTextField.text!
            default:
                break
            }
            
            
            
            pokemon?.ability = abilityTextField.text!
            pokemon?.item =  itemTextField.text!
            pokemon?.nature = natureTextField.text!
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
