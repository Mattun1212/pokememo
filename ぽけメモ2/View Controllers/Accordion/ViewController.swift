//
//  ViewController.swift
//  AnimatedReloadingTableViewExp
//
//  Created by Takeshi Tanaka on 10/31/15.
//  Copyright © 2015 p0dee. All rights reserved.
//

//henko-

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let RootCellIdentifier = "RootCellIdentifier"
    fileprivate let SubCellIdentifier = "SubCellIdentifier"
    fileprivate let extendedSections = NSMutableIndexSet()
    fileprivate let numberOfRowInSection = 7

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(TableViewRootCell.self, forCellReuseIdentifier: RootCellIdentifier)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: SubCellIdentifier)
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    //MARK:
    fileprivate func didSelectRootCell(_ section: NSInteger) {
        var extended = isSectionExtended(section)
        extended = !extended
        if extended {
            extendedSections.add(section)
        } else {
            extendedSections.remove(section)
        }
        
        let numOfRows = numberOfRowInSection
        var paths = [IndexPath]()
        for i in 1..<numOfRows {
            paths.append(IndexPath(row: i, section: section))
        }
//        tableView.reloadData()
//        tableView.reloadSections(NSIndexSet(index: section), withRowAnimation: .Automatic)
        tableView.beginUpdates()
        if extended {
            tableView.insertRows(at: paths, with: .automatic)
        } else {
            tableView.deleteRows(at: paths, with: .automatic)
        }
        tableView.endUpdates()
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: section)) as? TableViewRootCell {
                cell.extended = extended
            }
        }) 
    }
    
    fileprivate func isSectionExtended(_ section: NSInteger) -> Bool {
        return extendedSections.contains(section)
    }

    //MARK: <UITableViewDataSource>
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSectionExtended(section) ? numberOfRowInSection : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let isRoot = indexPath.row == 0
        let identifier = isRoot ? RootCellIdentifier : SubCellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if isRoot {
            if let cell = cell as? TableViewRootCell {
                cell.label.text = "Section \(indexPath.section)"
                cell.backgroundColor = UIColor(white: CGFloat(0.5 - 0.5 * Double(indexPath.section) / Double(tableView.numberOfSections)), alpha: 1.0)
                cell.label.textColor = UIColor.white
                cell.extended = isSectionExtended(indexPath.section)
            }
        } else {
            cell.textLabel?.text = "indexPath(\(indexPath.section), \(indexPath.row))";
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isRoot = indexPath.row == 0
        if isRoot {
            return isSectionExtended(indexPath.section) ? 30 : 60
        } else {
            return 44
        }
    }
    
    //MARK: <UITableViewDelegate>
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let isRoot = indexPath.row == 0
        if isRoot {
            didSelectRootCell(indexPath.section)
        }
    }
    
    
    
   
    
}

