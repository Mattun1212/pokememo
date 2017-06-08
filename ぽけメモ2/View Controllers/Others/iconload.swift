//
//  iconload.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/11/10.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class IconLoad: NSObject {
    
    func  loadcsv()->[[String]]{
        var resultArray = [[String]]()
        var count = 0
        let csvBundle = Bundle.main.path(forResource: "pokemonData", ofType: "csv")
        do {
            var csvData: String = try String(contentsOfFile: csvBundle!, encoding: String.Encoding.utf8)
            csvData = csvData.replacingOccurrences(of: "\r", with: "")
            let csvArray = csvData.components(separatedBy: "\n")
            print(csvArray)
            for line in csvArray {
                let parts = line.components(separatedBy: ",")
                
//                print(parts)
//                for i in 0...2{
                    resultArray.append(parts)
                    
//                }
                
                count += 1
                
            }
            print(resultArray)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return resultArray
    }

    }
