//
//  FormatViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/09/01.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//sssss

import UIKit

class FormatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var formatArray = [String]()
    var tapIndex: Int!  //tableViewでタップされた行を記録する
    let saveData: UserDefaults = UserDefaults.standard
    
    //最初に呼ばれるやつ
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        formatArray = ["シングル" , "ダブル", "WCS"]
    }

    //1セクションの中のRowの数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
        return formatArray.count
    }
    
    //どのCellを使って、Cellに何を表示するか決めるとこ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = formatArray[indexPath.row]
        
        return cell!
    }
    
    //Cellがタップされたら反応するとこ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("%@が選ばれました", formatArray[indexPath.row])
        tapIndex = indexPath.row
        
        //遷移
        performSegue(withIdentifier: "toFirst", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面に値を渡したい場合はここに書く
        let firstViewController = segue.destination as! FirstViewController
        // ここに値渡しのコード
        firstViewController.recieveIndex = tapIndex
        
    }

    
}
