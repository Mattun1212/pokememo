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
    var tapIndex: Int!
    let saveData: UserDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.s
        formatArray = ["シングル" , "ダブル", "WCS"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
        return formatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = formatArray[indexPath.row]
        
        return cell!
    }
    
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

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
