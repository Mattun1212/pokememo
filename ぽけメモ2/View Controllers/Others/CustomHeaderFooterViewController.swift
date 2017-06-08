//
//  CustomHeaderFooterViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/12/01.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class CustomHeaderFooterView: UITableViewHeaderFooterView {
    fileprivate var arrow = UIImageView()
    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.arrow.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.arrow)
        self.contentView.addConstraints([
            NSLayoutConstraint(item: arrow, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -8),
            NSLayoutConstraint(item: arrow, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpanded(_ expanded: Bool) {
        arrow.image = UIImage(named: expanded ? "ArrowUp" : "ArrowDown")
    }
}
